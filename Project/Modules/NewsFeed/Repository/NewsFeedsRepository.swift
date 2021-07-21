//
//  NewsFeedsRepository.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

enum NewsFeedsRepository{
   case news
}
extension NewsFeedsRepository: RequestProtocol{
    var baseURL: String{
        Constants.Service.hostURL
    }
    var path: String{
        switch self {
        case .news:
            return Constants.Service.newsFeeds
        }
    }
    var httpMethod: HTTPMethod{
        switch self {
        case .news:
            return .GET
        }
    }
    var httpBody: Data?{
        switch self {
        case .news:
            return nil
        }
    }
    var queryParams: [String : String]?{
        switch self {
        case .news:
            return NewsFeedsRequest().dictionary as? [String: String]
        }
    }
}
extension NewsFeedsRepository{
    typealias NewsData = ([DailyNews]?) -> Void
    func feeds(refreshType: NewsRefreshType,_ client: URLSessionProtocol = URLSession.shared, completion: @escaping NewsData, onError: @escaping StringCompletion){
        var refresh = refreshType
        let newsFromDB = feedsFromDatabase()?.sorted(by: { ($0.publicationDate?.toDate ?? Date()) > ($1.publicationDate?.toDate ?? Date())})
        if newsFromDB?.isEmpty == true{
            refresh = .server
        }
        switch refresh {
        case .server, .timer:
            HTTPClient(client).request(request: self) { (response: Result<BaseResponseModel<[DailyNews]>, HTTPError>) in
                switch response{
                case .success(let data):
                    let newNews = data.response?.results?.sorted(by: { ($0.publicationDate?.toDate ?? Date()) > ($1.publicationDate?.toDate ?? Date())})
                    let newNewsAvailabel = isNewDataAvailable(oldNews: newsFromDB, newNews: newNews)
                    if newNewsAvailabel{
                        DatabaseHandler.shared.delete(type: NewsFeeds.self)
                        newNews?.forEach({ news in
                            let savingNews: NewsFeeds? = DatabaseHandler.shared.add()
                            savingNews?.id = news.id?.encryptedValue()
                            savingNews?.type = news.type?.encryptedValue()
                            savingNews?.sectionId = news.sectionId?.encryptedValue()
                            savingNews?.sectionName = news.sectionName?.encryptedValue()
                            savingNews?.publicationDate = news.publicationDate?.encryptedValue()
                            savingNews?.newsDesc = news.newsDesc?.encryptedValue()
                            savingNews?.newsURL = news.newsURL?.encryptedValue()
                            savingNews?.thumbnail = news.newsInformation?.thumbnail?.encryptedValue()
                            savingNews?.newsInDetail = news.newsInformation?.newsInDetail?.encryptedValue()
                        })
                        Database.shared.saveContext()
                        completion(feedsFromDatabase())
                    }else{
                        completion(nil)
                    }
                case .failure(let error):
                    onError(error.localizedDescription)
                }
            }
        case .cache:
            DispatchQueue.main.async {
                completion(newsFromDB)
            }
        }
    }
    func feedsFromDatabase() -> [DailyNews]?{
        let newsFeedsFromDatabase: [NewsFeeds]? = DatabaseHandler.shared.fetch()?.sorted(by: { ($0.publicationDate?.toDate ?? Date()) > ($1.publicationDate?.toDate ?? Date())})
        return newsFeedsFromDatabase?.map({ DailyNews(id: $0.id?.decryptedValue(), type: $0.type?.decryptedValue(), sectionId: $0.sectionId?.decryptedValue(), sectionName: $0.sectionName?.decryptedValue(), publicationDate: $0.publicationDate?.decryptedValue(), newsDesc: $0.newsDesc?.decryptedValue(), newsURL: $0.newsURL?.decryptedValue(), newsInformation: NewsPlaceholder(thumbnail: $0.thumbnail?.decryptedValue(), newsInDetail: $0.newsInDetail?.decryptedValue())) })
    }
    func isNewDataAvailable(oldNews: [DailyNews]?, newNews: [DailyNews]?) -> Bool{
        if oldNews?.isEmpty == true{
            return true
        }
        if oldNews?.count ?? 0 > 0 && newNews?.count ?? 0 > 0, let oldNewsDate = oldNews?[0].publicationDate?.toDate, let newNewsDate = newNews?[0].publicationDate?.toDate{
            if newNewsDate > oldNewsDate{
                return true
            }
        }
        return false
    }
}

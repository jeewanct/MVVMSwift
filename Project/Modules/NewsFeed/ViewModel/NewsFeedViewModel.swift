//
//  NewsFeedViewModel.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import Foundation

class NewsFeedViewModel: BaseViewModel{
    var news: Bindable<[DailyNews]?> = Bindable(nil)
    var showNewNews: Bindable<Bool> = Bindable(false)
}
extension NewsFeedViewModel{
    func fetchNews(refreshType: NewsRefreshType, _ client: URLSessionProtocol = URLSession.shared){
        NewsFeedsRepository.news.feeds(refreshType: refreshType, client) { [weak self] news in
            self?.showHUD.value = false
            if let unwrappedNews = news{
                switch refreshType{
                case .server, .cache:
                    self?.news.value = unwrappedNews
                case .timer:
                    self?.showNewNews.value = true
                }
            }
        } onError: { [weak self]errorMessage in
            self?.showHUD.value = false
            self?.showAlert.value = errorMessage
        }
    }
}

//
//  NewsFeedsResponse.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

struct DailyNews: Codable{
    var id: String?
    var type: String?
    var sectionId: String?
    var sectionName: String?
    var publicationDate: String?
    var newsDesc: String?
    var newsURL: String?
    var newsInformation: NewsPlaceholder?
    private enum CodingKeys: String, CodingKey{
        case id, type, sectionId, sectionName
        case publicationDate = "webPublicationDate"
        case newsDesc = "webTitle"
        case newsURL = "webUrl"
        case newsInformation = "fields"
    }
}
struct NewsPlaceholder: Codable{
    var thumbnail: String?
    var newsInDetail: String?
    private enum CodingKeys: String, CodingKey{
        case thumbnail
        case newsInDetail = "bodyText"
    }
}

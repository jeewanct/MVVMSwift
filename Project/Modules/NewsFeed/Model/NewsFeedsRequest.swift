//
//  NewsFeedsRequest.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

struct NewsFeedsRequest: Codable{
    var query = "cricket"
    var apiKey = Constants.newsFeedsAPIKey
    var extraFields = "all"
    private enum CodingKeys: String, CodingKey{
        case query = "q"
        case apiKey = "api-key"
        case extraFields = "show-fields"
    }
}

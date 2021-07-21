//
//  NewsDetailsViewModel.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

class NewsDetailsViewModel: BaseViewModel{
    var news: DailyNews?
    init(news: DailyNews?){
        self.news = news
    }
}

//
//  NewsDetailsController.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import UIKit

class NewsDetailsController: BaseGenericController<NewsDetailsViewModel> {
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var lblPublicationDate: UILabel!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDesc: UILabel!
    @IBOutlet weak var lblNewsInDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func initialize() {
        super.initialize()
        imageNews.addImage(viewModel.news?.newsInformation?.thumbnail, UIImage(named: Constants.Images.NewsFeeds.newsPlaceholder.rawValue)!)
        lblPublicationDate.text = viewModel.news?.publicationDate
        lblNewsTitle.text = viewModel.news?.sectionName
        lblNewsDesc.text = viewModel.news?.newsDesc
        lblNewsInDetails.text = viewModel.news?.newsInformation?.newsInDetail
    }
    @IBAction func openNewsInBrowser(){
        loadExternalURL(urlString: viewModel.news?.newsURL)
    }
}
extension NewsDetailsController{
    static func instance(viewModel: NewsDetailsViewModel) -> NewsDetailsController{
        let controller: NewsDetailsController = UIViewController.load()
        controller.viewModel = viewModel
        controller.title = viewModel.news?.sectionName
        return controller
    }
}

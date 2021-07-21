//
//  NewsFeedsCell.swift
//  Project
//
//  Created by jeevan tiwari on 7/16/21.
//

import UIKit

class NewsFeedsCell: BaseTableCell<DailyNews> {
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var lblNewsDate: UILabel!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDesc: UILabel!
    @IBOutlet weak var lblNewsInDetail: UILabel!
    
    override var value: DailyNews?{
        didSet{
            lblNewsDate.text = value?.publicationDate
            lblNewsTitle.text = value?.sectionName
            lblNewsDesc.text = value?.newsDesc
            imageNews.addImage(value?.newsInformation?.thumbnail, UIImage(named: Constants.Images.NewsFeeds.newsPlaceholder.rawValue)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

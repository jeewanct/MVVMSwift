//
//  BaseTableCell.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit
class BaseTableCell<T>: UITableViewCell{
    var value: T?
    override  func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}



//
//  BaseTableView.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit

@IBDesignable
class BaseTableView: UITableView{
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorStyle = .none
        showsVerticalScrollIndicator = false
    }
    func registerCells(_ cells: UITableViewCell.Type...){
        cells.forEach { (cellName) in
            let identifier = String(describing: cellName.self)
            register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}

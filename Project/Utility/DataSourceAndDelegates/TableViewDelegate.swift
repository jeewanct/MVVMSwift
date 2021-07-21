//
//  TableViewDelegate.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate{
    var onClick: IntCompletion?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onClick?(indexPath.item)
    }
}

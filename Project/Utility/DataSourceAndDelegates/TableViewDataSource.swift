//
//  TableViewDelegateDataSource.swift
//  Project
//
//  Created by jeevan tiwari on 7/16/21.
//

import UIKit

class TableDataSource<T, U: BaseTableCell<T>>: NSObject,UITableViewDataSource{
    var items: [T]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: U.self)) as! U
        cell.value = items?[indexPath.item]
        return cell
    }
}

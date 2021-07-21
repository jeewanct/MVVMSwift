//
//  BaseGenericController.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit

class BaseGenericController<T: BaseViewModel>: UIViewController {
    var viewModel: T!
    var navigationTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        addListener()
    }
    func initialize() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func addListener() {
        viewModel.showHUD.bind { [unowned self](show) in
            self.refreshControl.endRefreshing()
        }
        viewModel.showAlert.bind { [unowned self](message) in
            self.showDefaultAlert(message: message)
        }
    }
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(named: "ColorSecondary")
        return refreshControl
    }()
}

extension BaseGenericController: Customization{}


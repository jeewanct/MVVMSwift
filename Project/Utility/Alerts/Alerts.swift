//
//  Alerts.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import UIKit

extension UIViewController{
    func showDefaultAlert(title: String? = Constants.appName, message: String?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(controller: alertController)
    }
}

//
//  ExtensionExternalURLs.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import UIKit

extension UIViewController{
    func loadExternalURL(urlString: String?){
        if let unwrappedURL = urlString,let  url = URL(string: unwrappedURL) {
            UIApplication.shared.open(url)
        }else{
            showDefaultAlert(message: "URL is incorrect")
        }
    }
}

//
//  AppDelegate.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AESEncryption.shared.checkForKey()
        return true
    }
}


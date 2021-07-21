//
//  SceneDelegate.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: NewsFeedController.instance(viewModel: NewsFeedViewModel(), title: Constants.Strings.NewsFeeds.title.rawValue))
        window?.makeKeyAndVisible()
    }
}


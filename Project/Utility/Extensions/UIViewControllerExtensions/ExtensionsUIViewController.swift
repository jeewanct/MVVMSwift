//
//  ExtensionsUIViewController.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit

extension UIViewController{
    static func load<T: UIViewController>()-> T{
        T(nibName: String(describing: T.self), bundle: nil)
    }
    func push(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func present(controller: UIViewController){
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    func pop(){
        self.navigationController?.popViewController(animated: true)
    }
    func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
}


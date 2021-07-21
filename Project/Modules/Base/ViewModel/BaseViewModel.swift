//
//  BaseViewModel.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import Foundation

class BaseViewModel{
    var showHUD: Bindable<Bool>                    = Bindable(false)
    var showAlert: Bindable<String?>               = Bindable(nil)
}



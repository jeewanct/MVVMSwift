//
//  BaseResponseModel.swift
//  Project
//
//  Created by jeevan tiwari on 7/16/21.
//

import Foundation
class BaseResponseModel<T: Codable>: Codable{
    var response: BaseResultModel<T>?
}
class BaseResultModel<T: Codable>: Codable{
    var results: T?
}

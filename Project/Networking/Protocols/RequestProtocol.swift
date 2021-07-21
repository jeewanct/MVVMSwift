//
//  RequestProtocol.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get}
    var httpMethod: HTTPMethod { get }
    var httpBody: Data? { get }
    var queryParams: [String: String]? { get }
}


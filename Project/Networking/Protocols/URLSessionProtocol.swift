//
//  URLSessionProtocol.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

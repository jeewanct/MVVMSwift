//
//  RequestProtocol.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

extension RequestProtocol{
    func request() -> URLRequest{
        let url = baseURL + path
        guard var urlComponent = URLComponents(string: url) else {
            fatalError("Unable to create url component")
        }
        var queryItem = [URLQueryItem]()
        for (key, value) in queryParams ?? [String: String](){
            queryItem.append(URLQueryItem(name: key, value: String(describing: value)))
        }
        urlComponent.queryItems = queryItem
        
        var urlRequest =
            URLRequest(url: urlComponent.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: NetworkConstants.timeoutInterval)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = httpBody
        urlRequest.allHTTPHeaderFields = HTTPHeader().headers
        return urlRequest
    }
}

extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}

//
//  HTTPError.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

struct HTTPError: Error{
    var localizedDescription: String?
    var statusCode: HTTPStatusCodes
    init(_ description: String? = "Something went wrong", _ statusCode: HTTPStatusCodes = .apiError) {
        localizedDescription    = description
        self.statusCode         = statusCode
    }
}

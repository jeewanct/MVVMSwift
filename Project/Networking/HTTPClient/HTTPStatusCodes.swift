//
//  HTTPStatusCodes.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

enum HTTPStatusCodes: Int, Codable{
    case apiError               = 1
    case unknown
}

extension HTTPStatusCodes {
    public init(from decoder: Decoder) throws {
        self = try HTTPStatusCodes(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

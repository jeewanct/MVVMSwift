//
//  NewsFeedsRequest.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

extension Encodable{
    var rawData: Data?{
        try? JSONEncoder().encode(self)
    }
    var dictionary: [String: Any]?{
        try? JSONSerialization.jsonObject(with: self.rawData!, options: .mutableLeaves) as? [String: Any]
    }
}

extension Dictionary{
    var data: Data?{
        try? JSONSerialization.data(withJSONObject: self, options: [])
    }
}

extension Encodable{
    var data: Data?{
        try? JSONEncoder().encode(self)
    }
}

extension Data{
    func decode<T: Codable>() -> T?{
        try? JSONDecoder().decode(T.self, from: self)
    }
}

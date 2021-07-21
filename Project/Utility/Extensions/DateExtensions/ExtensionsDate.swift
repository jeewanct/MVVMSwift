//
//  ExtensionsDate.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation

extension Date{
    var toTimeStamp: CLong{
        CLong(self.timeIntervalSince1970)
    }
}
extension String{
    var toDate: Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = Constants.defaultTimeFormat
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}

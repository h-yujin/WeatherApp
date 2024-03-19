//
//  String+Extension.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

extension String {
    public func toHourMinute() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    public func toDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.dateFormat = "(E) HH:mm"
        let formattedString = dateFormatter.string(from: date)
        return formattedString
    }
}

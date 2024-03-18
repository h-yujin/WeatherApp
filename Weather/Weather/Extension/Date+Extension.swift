//
//  Date+Extension.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

extension Date {
    var toDateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 (E)"
        return formatter.string(from: self)
    }
}

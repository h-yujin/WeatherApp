//
//  Constant.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation


enum Constant {}

extension Constant {
    static let appID = "5d3b29a1172ae69f6bb90a449a3a3518"
    static let baseUrl = "https://api.openweathermap.org/data/2.5"
    static let currentUrl = "/weather"
    static let forecastUrl = "/forecast"
    static let defaultLat: Float = 37.5
    static let defaultLng: Float = 126.8
    static let imageUrlPrefix = "https://openweathermap.org/img/wn/"
    static let imageUrlSuffix = "@2x.png"
}

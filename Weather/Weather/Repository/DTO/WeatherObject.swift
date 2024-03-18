//
//  WeatherObject.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

struct WeatherObject: Decodable {
    var base: String
    var main: WeatherMainObject?
    var info: [WeatherInfoObject]?
    
    enum CodingKeys: String, CodingKey {
        case base
        case main
        case info = "weather"
    }
}

struct WeatherMainObject: Decodable {
    let temp: Float?
    let tempMin: Float?
    let tempMax: Float?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

struct WeatherInfoObject: Decodable {
    let description: String?
}

extension WeatherObject {
    func toModel() -> Weather {
        return Weather(id: UUID().uuidString,
                       temp: main?.temp,
                       tempMin: main?.tempMin,
                       tempMax: main?.tempMax,
                       humidity: main?.humidity,
                       description: info?[0].description)
    }
}

//
//  WeatherObject.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

struct WeatherObject: Decodable {
    var base: String?
    
    var main: WeatherMainObject?
    var info: [WeatherInfoObject]?
    var list: [WeatherObject]?
    var dateText: String?
    
    enum CodingKeys: String, CodingKey {
        case base
        case main
        case info = "weather"
        case list
        case dateText = "dt_txt"
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
    var icon: String?
}

extension WeatherObject {
    func toModel() -> Weather {
        return Weather(id: UUID().uuidString,
                       iconUrl: Constant.imageUrlPrefix + (info?[0].icon ?? "") + Constant.imageUrlSuffix,
                       description: info?[0].description,
                       temp: main?.temp?.kelvinToCelsius(),
                       tempMin: main?.tempMin?.kelvinToCelsius(),
                       tempMax: main?.tempMax?.kelvinToCelsius(),
                       humidity: main?.humidity,
                       dateText: dateText ?? "")
    }
    
    func toModelList() -> ForecaseWeather {
        let list = list ?? []
        return ForecaseWeather(list: Array(list.map {$0.toModel()}))
    }
}

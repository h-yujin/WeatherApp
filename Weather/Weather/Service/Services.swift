//
//  Services.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

protocol ServiceType {
    var weatherService: WeatherServiceType { get set }
}

class Services: ServiceType {
    var weatherService: WeatherServiceType
    
    init() {
        self.weatherService = WeatherService(weatherReposity:
                                                WeatherRepository(apiController:
                                                        .weather(lat: Constant.defaultLat, lng: Constant.defaultLng)))
    }
}

class StubService: ServiceType {
    var weatherService: WeatherServiceType = StubWeatherService()
}

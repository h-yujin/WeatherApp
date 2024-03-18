//
//  WeatherService.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation
import Combine
import Alamofire

protocol WeatherServiceType {
//    func getWeather() -> AnyPublisher<DataResponse<WeatherObject, NetworkError>, Never>
    func getWeather() -> AnyPublisher<Weather, NetworkError>
}

class WeatherService: WeatherServiceType {
    
    private var weatherReposity: WeatherRepositoryType
    
    init(weatherReposity: WeatherRepositoryType) {
        self.weatherReposity = weatherReposity
    }
   
    func getWeather() -> AnyPublisher<Weather, NetworkError> {
        // WeatherObject -> WeatherModel
        weatherReposity.getWeather()
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
}

class StubWeatherService: WeatherServiceType {
  
    func getWeather() -> AnyPublisher<Weather, NetworkError> {
        Empty().eraseToAnyPublisher()
    }

}

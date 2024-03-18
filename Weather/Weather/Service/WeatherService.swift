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
    func getWeather() -> AnyPublisher<Weather, NetworkError>
    func getForecast() -> AnyPublisher<ForecaseWeather, NetworkError>
}

class WeatherService: WeatherServiceType {
    
    private var weatherReposity: WeatherRepositoryType
    
    init(weatherReposity: WeatherRepositoryType) {
        self.weatherReposity = weatherReposity
    }
   
    func getWeather() -> AnyPublisher<Weather, NetworkError> {
        weatherReposity.getWeather()
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
    
    func getForecast() -> AnyPublisher<ForecaseWeather, NetworkError> {
        weatherReposity.getForecast()
            .map { $0.toModelList() }
            .eraseToAnyPublisher()
    }
}

class StubWeatherService: WeatherServiceType {
  
    func getWeather() -> AnyPublisher<Weather, NetworkError> {
        Empty().eraseToAnyPublisher()
    }
    
    func getForecast() -> AnyPublisher<ForecaseWeather, NetworkError> {
        Empty().eraseToAnyPublisher()
    }

}

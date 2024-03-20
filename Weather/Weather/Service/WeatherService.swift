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
    func getWeather() -> AnyPublisher<Weather, ServiceError>
    func getForecast() -> AnyPublisher<ForecaseWeather, ServiceError>
    func getCityWeather(search: String) -> AnyPublisher<Weather, ServiceError>
}

class WeatherService: WeatherServiceType {
    
    private var weatherReposity: WeatherRepositoryType
    
    init(weatherReposity: WeatherRepositoryType) {
        self.weatherReposity = weatherReposity
    }
   
    func getWeather() -> AnyPublisher<Weather, ServiceError> {
        weatherReposity.getWeather()
            .map { $0.toModel() }
            .mapError { ServiceError.error($0) }
            .eraseToAnyPublisher()
    }
    
    func getForecast() -> AnyPublisher<ForecaseWeather, ServiceError> {
        weatherReposity.getForecast()
            .map { $0.toModelList() }
            .mapError { ServiceError.error($0) }
            .eraseToAnyPublisher()
    }
    
    func getCityWeather(search: String) -> AnyPublisher<Weather, ServiceError> {
        weatherReposity.getCityWeather(search: search)
            .map { $0.toModel() }
            .mapError { ServiceError.error($0) }
            .eraseToAnyPublisher()
    }
}

class StubWeatherService: WeatherServiceType {
  
    func getWeather() -> AnyPublisher<Weather, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
    
    func getForecast() -> AnyPublisher<ForecaseWeather, ServiceError> {
        Empty().eraseToAnyPublisher()
    }

    func getCityWeather(search: String) -> AnyPublisher<Weather, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
}

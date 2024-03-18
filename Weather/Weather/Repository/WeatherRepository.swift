//
//  WeatherRepository.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation
import Combine
import Alamofire

protocol WeatherRepositoryType {
    func getWeather()  -> AnyPublisher<WeatherObject, NetworkError>
}

class WeatherRepository: WeatherRepositoryType {
    var apiController: APIController
    
    init(apiController: APIController) {
        self.apiController = apiController
    }
    
    func getWeather() -> AnyPublisher<WeatherObject, NetworkError> {
        apiController.fetchData(.weather(lat: Constant.defaultLat, lng: Constant.defaultLng))
            .tryMap { dataResponse in
                guard let weatherObject = dataResponse.value else {
                    throw dataResponse.error ?? NetworkError.unknown
                }
                return weatherObject
            }
            .mapError { error in
                if let networkError = error as? NetworkError {
                    return networkError
                } else {
                    return NetworkError.unknown
                }
            }
            .eraseToAnyPublisher()
        
    }
}
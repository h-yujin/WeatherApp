//
//  APIController.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation
import Combine
import Alamofire
import AlamofireNetworkActivityLogger

enum APIController {
    case weather(lat: Float, lng: Float)
    case forecast(lat: Float, lng: Float)
    case cityWeather(search: String)
}

extension APIController {
    
    var baseURL: URL {
        return URL(string: Constant.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .weather, .cityWeather:
            return Constant.weatherUrl
        case .forecast:
            return Constant.forecastUrl
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .weather, .forecast, .cityWeather:
            return .get
        }
    }
    
    
    func fetchData(_ api: APIController)  -> AnyPublisher<DataResponse<WeatherObject, NetworkError>, Never> {
        NetworkActivityLogger.shared.startLogging()
        let url = "\(baseURL)\(api.path)"
        var parameters: Parameters = ["appid": Constant.appID,
                                      "lang": "kr"]
        switch api {
        case .weather(lat: let lat, lng: let lon), .forecast(lat: let lat, lng: let lon):
            parameters.updateValue(lat, forKey: "lat")
            parameters.updateValue(lon, forKey: "lon")
        case .cityWeather(search: let search):
            parameters.updateValue(search, forKey: "q")
        }
        

        return AF.request(url, method: method,parameters: parameters)
            .validate()
            .publishDecodable(type: WeatherObject.self)
            .map { response in
                response.mapError { error in
                    return NetworkError.error(error)
                }
            }
            .eraseToAnyPublisher()
        
    }
}

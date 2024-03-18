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
}

extension APIController {
    
    var baseURL: URL {
        return URL(string: Constant.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .weather:
            return Constant.weatherUrl
        case .forecast:
            return Constant.forecastUrl
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .weather, .forecast:
            return .get
        }
    }
    
    
    func fetchData(_ api: APIController)  -> AnyPublisher<DataResponse<WeatherObject, NetworkError>, Never> {
        NetworkActivityLogger.shared.startLogging()
        var url = "\(baseURL)"
        var parameters: Parameters = ["appid": Constant.appID]
        switch api {
        case .weather(lat: let lat, lng: let lon), .forecast(lat: let lat, lng: let lon):
            url += api.path
            parameters.updateValue(lat, forKey: "lat")
            parameters.updateValue(lon, forKey: "lon")
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

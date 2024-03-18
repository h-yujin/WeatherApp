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
}

extension APIController {
    var baseURL: URL {
        return URL(string: Constant.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .weather:
            return Constant.currentUrl
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .weather:
            return .get
        }
    }
    
    
    func fetchData(_ path: APIController)  -> AnyPublisher<DataResponse<WeatherObject, NetworkError>, Never> {
        NetworkActivityLogger.shared.startLogging()
        var url = "\(baseURL)"
        var parameters: Parameters = ["appid": Constant.appID]
        switch path {
        case .weather(lat: let lat, lng: let lon):
            url += Constant.currentUrl
            parameters.updateValue(lat, forKey: "lat")
            parameters.updateValue(lon, forKey: "lon")

            return AF.request(url,
                              method: method,
                              parameters: parameters)
            .publishDecodable(type: WeatherObject.self)
            .map { response in
                print(response)
                return response.mapError { error in
                    return NetworkError.error(error)
                }
            }
            .eraseToAnyPublisher()
        }
        
    }
}

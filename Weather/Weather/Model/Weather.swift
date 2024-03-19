//
//  Weather.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

struct Weather: Identifiable {
    var id: String?
    
    var iconUrl: String?
    var description: String?
    
    var temp: Float?
    var tempMin: Float?
    var tempMax: Float?
    var humidity: Int?
    var dateText: String?
}

extension Weather {
    static var stub1: Weather {
        .init(id: "1")
    }
    
    static var stub2: Weather {
        .init(id: "2")
    }
    
    static var stub3: Weather {
        .init(id: "3")
    }
    
    static var stub4: Weather {
        .init(id: "4")
    }
}

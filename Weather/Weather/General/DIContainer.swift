//
//  DIContainer.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}

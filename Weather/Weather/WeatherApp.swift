//
//  WeatherApp.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject var container: DIContainer = .init(services: Services())
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(container)
        }
    }
}

//
//  HomeViewModel.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    enum Action {
        case getWeather
    }
    
    @Published var forecast: [Weather] = []
    @Published var weather: Weather?
 
    private var container: DIContainer
    var cancellables: Set<AnyCancellable> = []
    
    init(container: DIContainer) {
        self.container = container
    }
    
    
    func send(action: Action) {
        switch action {
        case .getWeather:
            container.services.weatherService.getWeather()
                .sink { com in
                    
                } receiveValue: { [weak self] response in
                    self?.weather = response
                }.store(in: &cancellables)
            
            container.services.weatherService.getForecast()
                .sink { com in
                    
                } receiveValue: { [weak self] response in
                    if let list = response.list {
                        self?.forecast = list
                    }
                }.store(in: &cancellables)
            return
        }
    }
    
}

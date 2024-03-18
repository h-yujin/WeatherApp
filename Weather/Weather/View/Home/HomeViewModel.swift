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
    @Published var phase: Phase = .notRequested
 
    private var container: DIContainer
    var cancellables: Set<AnyCancellable> = []
    
    init(container: DIContainer) {
        self.container = container
    }
    
    
    func send(action: Action) {
        switch action {
        case .getWeather:
            phase = .loading
            Publishers.Zip(container.services.weatherService.getWeather(),
                           container.services.weatherService.getForecast())
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.phase = .fail(error)
                default: break
                }
            } receiveValue: { [weak self] (weather, forecaseWeather) in
                self?.weather = weather
                self?.forecast = forecaseWeather.list ?? []
                self?.phase = .success
            }.store(in: &cancellables)

            return
        }
    }
    
}

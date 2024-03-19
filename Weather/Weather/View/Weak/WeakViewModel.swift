//
//  WeakViewModel.swift
//  Weather
//
//  Created by Hong yujin on 3/19/24.
//

import Foundation
import Combine

class WeakViewModel: ObservableObject {
    enum Action {
        case getForecast
    }
    
    @Published var forecast: [Weather] = []
    @Published var phase: Phase = .notRequested
    
    private var container: DIContainer
    var cancellables: Set<AnyCancellable> = []
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(action: Action) {
        switch action {
        case .getForecast:
            phase = .loading
            container.services.weatherService.getForecast()
                .sink { [weak self] completion in
                    switch completion {
                    case .failure(let error):
                        self?.phase = .fail(error)
                    default: break
                    }
                } receiveValue: { [weak self] forecaseWeather in
                    self?.forecast = forecaseWeather.list ?? []
                    self?.phase = .success
                }.store(in: &cancellables)
        }
    }
    
}

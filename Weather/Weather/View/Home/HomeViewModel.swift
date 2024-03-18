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
    
    @Published var todays: [Weather] = [.stub1, .stub2, .stub3, .stub4]
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
                    print(com)
                } receiveValue: { [weak self] response in
                    self?.weather = response
                }.store(in: &cancellables)
            return
        }
    }
    
}

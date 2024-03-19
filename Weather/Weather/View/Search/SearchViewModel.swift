//
//  SearchViewModel.swift
//  Weather
//
//  Created by Hong yujin on 3/19/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    enum Action {
        case requestSearch(String)
        case clearSearchText
    }
    
    @Published var weather: Weather?
    @Published var searchText: String = ""
    @Published var shouldBecomFirstResponder: Bool = false
    
    private var container: DIContainer
    private var cancellables = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
        
        bind()
    }
    
    
    private func bind() {
        $searchText
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .sink {  [weak self] text in
                if !text.isEmpty {
                    self?.send(action: .requestSearch(text))
                }
            }.store(in: &cancellables)
    }
    
    private func send(action: Action) {
        switch action {
        case let .requestSearch(query):
            container.services.weatherService.getCityWeather(search: query)
                .sink { completion in

                } receiveValue: { [weak self] weather in
                    self?.weather = weather
                }.store(in: &cancellables)
        case .clearSearchText:
            searchText = ""
            shouldBecomFirstResponder = false
            self.weather = nil
        }
    }
}

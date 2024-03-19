//
//  SearchView.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var viewModel: SearchViewModel
    
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText,
                      shouldBecomFirstResponder: $viewModel.shouldBecomFirstResponder)
            
            resultView
                .onTapGesture {
                    viewModel.shouldBecomFirstResponder = false
                }
        }
        .background(Color.mintBg)
    }
    
    var resultView: some View {
        VStack {
            if viewModel.weather != nil {
                DetailView(title: Date().toDateString,
                           weather: viewModel.weather ?? Weather())
            }
            
            Spacer()
        }
    }
}

#Preview {
    SearchView(viewModel: .init(container: DIContainer(services: StubService())))
}

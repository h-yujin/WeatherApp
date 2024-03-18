//
//  ContentView.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import SwiftUI

struct MainTabView: View {
    @State  private var selectedTab: MainTabType = .home
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .home:
                        HomeView()
                    case .weak:
                        WeakView()
                    case .search:
                        SearchView()
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.imageName(selected: selectedTab == tab))
                }
                .tag(tab)
            }
        }
        .tint(Color.black)
    }
}

#Preview {
    MainTabView()
}
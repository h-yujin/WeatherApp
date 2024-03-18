//
//  MainTabType.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

enum MainTabType: String, CaseIterable {
  case home
  case weak
  case search
  
  var title: String {
    switch self {
    case .home:
      return "홈"
    case .weak:
      return "주간날씨"
    case .search:
      return "검색"
    }
  }
  
  func imageName(selected: Bool) -> String {
      switch self {
      case .home:
          return selected ? "house" : "house.fill"
      case .weak:
          return selected ? "sun.haze" : "sun.haze.fill"
      case .search:
          return selected ? "magnifyingglass.circle" : "magnifyingglass.circle.fill"
      }
  }
}

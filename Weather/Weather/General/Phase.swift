//
//  Phase.swift
//  Weather
//
//  Created by Hong yujin on 3/19/24.
//

import Foundation

enum Phase {
  case notRequested
  case loading
  case success
  case fail(Error)
}

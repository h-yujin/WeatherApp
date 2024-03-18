//
//  NetworkError.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import Foundation

public enum NetworkError: Error {
    case error(Error)
    case unknown
    case emptyValue
}

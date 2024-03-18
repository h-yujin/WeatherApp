//
//  Float+Extension.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//


extension Float {
    // °F -> °C
    public func fahrenheitToCelsius() -> Float{
        return (self - 32) / 1.8
    }
    
    // °C -> °F
    public func celsiusToFahrenheit() -> Float{
        return (self * 1.8) + 32
    }
    
    // K -> °C
    public func kelvinToCelsius() -> Float {
        return self - 273.15
    }
    
    // K -> °F
    public func kelvinToFahrenheit() -> Float {
        return self * 9/5 - 459.67
    }
}

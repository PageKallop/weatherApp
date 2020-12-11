//
//  WeatherData.swift
//  weatherApp
//
//  Created by Page Kallop on 12/9/20.
//

import Foundation

struct WeatherData: Codable {
    
    let name: String 
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int 
}

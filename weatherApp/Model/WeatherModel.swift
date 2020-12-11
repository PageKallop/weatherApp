//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Page Kallop on 12/10/20.
//  Copyright © 2020 Marie.Kallop. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    //stores weather data
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
   
    // turn temp into a string
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
   //gets condition image
    var conditionName: String {
        
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}

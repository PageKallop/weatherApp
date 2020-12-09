//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Page Kallop on 12/9/20.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=9673b67f0d9fe1c5a7061abfd8b8818f&units=imperial"
    
    
    
    func getWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
        
    }
    
    // Create networking
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                  self.parseJSON(weatherData: safeData)
                    print("request")
                }
            }
            task.resume()
        }
    }
    
    // decoding data
    
    func parseJSON(weatherData: Data){
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
        } catch {
            print(error)
        }
    }
    
}

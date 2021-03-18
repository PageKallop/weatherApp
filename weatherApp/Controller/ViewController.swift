//
//  ViewController.swift
//  weatherApp
//
//  Created by Page Kallop on 12/8/20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    

   
    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        locationManager.delegate = self
        weatherManager.delegate = self
        searchTextField.delegate = self
    
    }
    
    
    @IBAction func locationPressed(_ sender: UIButton) {
        
        locationManager.requestLocation()
    }
    
}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
   
    
    @IBAction func searchPressed(_ sender: UIButton) {
//        print(searchTextField.text!)
        searchTextField.endEditing(true)
        
    }
    
    // returns textfield input
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(searchTextField.text!)
        searchTextField.endEditing(true)
        
        return true
    }
    
    // validates user input
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type a city"
            return false
        }
    }
    
    // inputs city name then will empty textfield
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let cityName = searchTextField.text
        
        //removes spaces
        let city = cityName!.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "%20")
        
      
        weatherManager.getWeather(cityName: city)
        
       
        searchTextField.text = ""
    }
    
}

//MARK: - WeatherManagerDelegate 

extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.tempLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
        print(weather.cityName)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    // get current location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            locationManager.stopUpdatingLocation()
            
            
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.getWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

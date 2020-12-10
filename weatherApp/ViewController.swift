//
//  ViewController.swift
//  weatherApp
//
//  Created by Page Kallop on 12/8/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

   
    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchTextField.delegate = self
    }

    
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
        
        if let city = searchTextField.text {
            weatherManager.getWeather(cityName: city)
        }
       
        searchTextField.text = ""
    }
    

}


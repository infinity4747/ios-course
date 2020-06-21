//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation //library for location

class WeatherViewController: UIViewController{
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        searchTextField.delegate = self
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func currentLocationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
}
// MARK: - UITestFieldDelegate

extension WeatherViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           searchTextField.endEditing(true)
           print(searchTextField.text!)
           return true
       }
       
       func textFieldDidEndEditing(_ textField: UITextField) {
           weatherManager.featchWeather(cityName: textField.text!)
           textField.text = " "
       }
       func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
           if textField.text == " " {
               textField.placeholder = "Type something"
               return false
           }else{
               return true
               
           }
       }
}
// MARK: - WeatherManagerDelegate
extension WeatherViewController : WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager:WeatherManager,weather: WeatherModel) {
            DispatchQueue.main.async {//You must read about DispatchQuese
                self.temperatureLabel.text = weather.temperatureString
                print(weather.conditionName)
                self.conditionImageView.image = UIImage(systemName:weather.conditionName)
                self.cityLabel.text = weather.cityName
            }
    //        print(weather.temperature)
          }
        func didFailWithError(_ error: Error) {
            print(error)
        }
}
// MARK: - CCLocationManager
extension WeatherViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lan = Double(location.coordinate.latitude)
            let long = Double(location.coordinate.longitude)
            
            weatherManager.featchWeather(latitude: lan, longitude: long)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

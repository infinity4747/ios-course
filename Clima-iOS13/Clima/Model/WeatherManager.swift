//
//  WeatherManager.swift
//  Clima
//
//  Created by Alua D on 1/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
protocol WeatherManagerDelegate { //для того что бы сделать делегат нужен протокол
    func didUpdateWeather(_ weatherManager : WeatherManager,weather : WeatherModel)
    func didFailWithError(_ error: Error)
}
struct WeatherManager {
    let appID = "e0e569ae5ea9964aa35ff8f7d002ca3a"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e0e569ae5ea9964aa35ff8f7d002ca3a&units=metric"//must be save url with https
    var delegate : WeatherManagerDelegate?
    
    func featchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func featchWeather(latitude:Double,longitude:Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    func performRequest(with urlString : String){
        //1.create a URL
//        if let url = URL(string:urlString){//Прочитать по больше про url(parametrs)
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? " ") {
            //2.Create a URLSession
            let session = URLSession(configuration: .default)//прочитать про configuration type
            //3.Give the session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let saveData = data{
                    // let dataString = String(data: saveData, encoding: .utf8)
                    if let weather = self.parseJSON(saveData){
                        self.delegate?.didUpdateWeather(self,weather: weather)//делаем делегат что бы можно было использовать дату не только в weatherviewController-е а в других местах тоже
                    }
                }
            } //понять в чем разница просто и с completionHandle
            //4.start task
            task.resume()//прочитать про resume?
        }
    }
    
    func parseJSON(_ jsonData:Data)-> WeatherModel?{
        let decode = JSONDecoder()
        do{
            let decodableData = try decode.decode(WeatherData.self, from:jsonData)
            let id =  decodableData.weather[0].id
            let name = decodableData.name
            let temp = decodableData.main.temp
            let weatherModel = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weatherModel
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
        
    }
    
}

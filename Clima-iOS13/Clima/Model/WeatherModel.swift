//
//  WeatherModel.swift
//  Clima
//
//  Created by Alua D on 1/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel {
    let conditionId: Int
    let cityName : String
    let temperature :Double
    var temperatureString : String{
        return String(format: "%.0f",temperature)
    }
    var conditionName :String { // must be var because it change depend on something
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
   //Make from function - > Value (Ex : from getConditionName ->conditonName)
//    func getConditionName(weatherId: Int)->String{
//        switch weatherId {
//        case 200...232:
//            return "cloud.bolt"
//        case 300...321:
//            return "cloud.drizzle"
//        case 500...531:
//            return "cloud.rain"
//        case 600...622:
//            return "cloud.snow"
//        case 701...781:
//            return "cloud.fog"
//        case 800:
//            return "sun.max"
//        case 801...804:
//            return "cloud.bolt"
//        default:
//            return "cloud"
//        }
//    }
}

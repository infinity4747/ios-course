//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Alua D on 1/18/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    var bmi : BMI?
    func getBMIValue()-> String{
        let bmiTo1DecimalPlace = String(format:"%0.1f",bmi?.value ?? "0.0")
        return bmiTo1DecimalPlace
    }
    func getBMI() -> BMI {
        return bmi ?? BMI(value: 0.0, advice: "no advice", color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
    }
    mutating func calculateBMIValue(height:Float,weight:Float){
        let bmiValue = weight / pow(height,2)
        if bmiValue < 18.2{
            bmi = BMI(value: bmiValue, advice:"Eat more pies", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "fit as a fiddle", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "eat less pies", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
}

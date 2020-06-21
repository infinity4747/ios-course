//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderPressed(_ sender: UISlider) {
        heightLabel.text = String(format:"%.2f",sender.value) + "m"
    }
    
    @IBAction func weightSliderPressed(_ sender: UISlider) {
        weightLabel.text = String(format:"%.f",sender.value) + "kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMIValue(height:heightSlider.value,weight:weightSlider.value)
        
//        let secondVC = SecondViewController()
//        secondVC.BMI = String(format : "%.1f",BMI)
//        self.present(secondVC, animated: true, completion: nil)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = calculatorBrain.getBMI()
        }
    }
}


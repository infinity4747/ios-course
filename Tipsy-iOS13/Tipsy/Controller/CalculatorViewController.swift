//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var zeroButtonLabel: UIButton!
    @IBOutlet weak var tenButtonLabel: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyButtonLabel: UIButton!
    @IBOutlet weak var buildTextField: UITextField! //billText
    var tip = 0.10
    var billTotal = 0.0
    var numberOfPeople = 2
    var result = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChange(_ sender: UIButton) {
        buildTextField.endEditing(true)
        zeroButtonLabel.isSelected = false
        tenButtonLabel.isSelected = false
        twentyButtonLabel.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPersentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPersentSign)!
        tip = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChange(_ sender:UIStepper) {
        splitNumberLabel.text = String(format : "%.0f",sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = buildTextField.text!
        
        if bill != ""{
            billTotal = Double(bill)!
            result = billTotal * (1 + tip) / Double(numberOfPeople)
            
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = result
            destinationVC.tip = String(format:"%.0f",tip*100)  + "%"
            destinationVC.numberOfPeople = numberOfPeople
            
        }
    }
}


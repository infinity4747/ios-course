//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Alua D on 1/16/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
        var BMI = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = BMI
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(label)
        view.backgroundColor = .red
    }
}

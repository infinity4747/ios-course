//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Alua D on 1/18/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var result : Double!
    var tip :String!
    var numberOfPeople : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(format:"%.1f",result)
        infoLabel.text = "Split between \(numberOfPeople ?? 2) people, with \(tip ?? "10%") tip."
        // Do any additional setup after loading the view
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentPicker: UIPickerView!
    @IBOutlet weak var currentLabel: UILabel!
    var coinManager = CoinManager()
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPicker.dataSource = self
        currentPicker.delegate = self
        coinManager.delegate =  self
        // Do any additional setup after loading the view.
    }
}
// MARK: - UIPickerViewDataSource
extension ViewController :UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return coinManager.currencyArray.count
    }
}
// MARK: - UIPickerViewDelegate
extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for : selectedCurrency)
        print(coinManager.currencyArray[row])
    }
}
// MARK: - CoinManagerDelegate
extension ViewController :CoinManagerDelegate{
    func didUpdateView(price: Double,currency : String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(price)
            self.currentLabel.text = currency
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}

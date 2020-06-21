//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate {
    func didUpdateView(price : Double,currency : String)
    func didFailWithError(_ error : Error)
}
struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    var currencyName :String?
    mutating func getCoinPrice(for currency : String){
        currencyName = currency
        let urlString = "\(baseURL)\(currency)"
        
        performRequest(with: urlString)
    }
    func performRequest(with urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponce, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let saveData =  data{
//                    let dataInString = String(data: saveData, encoding: .utf8)
//                    print(dataInString)
                    if let price = self.parseJson(jsonData: saveData){
//                    print(price)
                        self.delegate?.didUpdateView(price: price, currency:self.currencyName! )
                    }
                }
            }
            task.resume()
        }
    }
    func parseJson(jsonData : Data)-> Double?{
        let decode = JSONDecoder()
        do{
            let decodedData = try decode.decode(CoinData.self , from: jsonData)
            let lastPrice =  decodedData.last
            print(lastPrice)
            return lastPrice
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
}

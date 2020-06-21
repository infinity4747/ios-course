//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Alua D on 1/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

//struct Question {
//    let text : String
//    let answer : String
//
//    init(q : String, a : String) {
//        text = q
//        answer = a
//    }
//}

struct Question {
    let text:String
    let variants : [String]
    let answer: String
    
    init(q: String , a: [String], correctAnswer: String){
        text = q
        variants = a
        answer = correctAnswer
    }

}

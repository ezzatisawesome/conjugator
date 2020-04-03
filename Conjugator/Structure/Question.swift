//
//  Quesiton.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import Foundation

struct Question {
    
    let infinitive: String // infinitive form of verb
    let tense: Tense // tense of verb
    let form: Form // form of verb
    let conjugated: String // final conjugated form of verb
    
    // Blank initializer
    init() {
        self.infinitive = ""
        self.tense = .indicativePresent
        self.form = .s1
        self.conjugated = ""
    }
    
    init(infinitive: String, tense: Tense, form: Form) {
        self.infinitive = infinitive
        self.tense = tense
        self.form = form
        
        let pos = verbList.firstIndex(of: infinitive) // position of Verb instance to get conjugated form

        self.conjugated = verbData[pos!].getConjugated(tense: tense, form: form) // calling getConjugated form
    }
    
    func checkCorrect(ans: String) -> Bool {
        return ans == self.conjugated
    }
}

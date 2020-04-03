//
//  CSVParse.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import Foundation
import CSV

class CSVParse {
    
    var verbArray = [[String]]()
    
    var verbsAlreadyInput = [String]()
    var verbCompleteData = [Verb]()
    var count = 0
    
    func parseCSVFile() {
        
        if let fileURL = Bundle.main.url(forResource: "verb_database", withExtension: "csv") {
            if let fileContents = InputStream(url: fileURL) {
                let csv = try! CSVReader(stream: fileContents)
                while let row = csv.next() {
                    verbArray.append(row)
                }
            }
        }
    }
    
    func parseVerbArray() {
        
        for row in verbArray {
            let infinitive = row[0]
            if(!verbsAlreadyInput.contains(infinitive)) {
                verbsAlreadyInput.append(infinitive)
                verbCompleteData.append(Verb(name: infinitive))
                count += 1
            }
            
            let pos = verbsAlreadyInput.firstIndex(of: infinitive)
            let mood = row[3] // column that states what mood the current row and verb is in
            let tense = row[5] // column that states which tense the current row and verb is in
            
            if (mood == "Indicative") {
                if (tense == "Present") {
                    let conj = Conjugations(tense: Tense.indicativePresent, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indPresent = conj
                }
                else if (tense == "Future") {
                    let conj = Conjugations(tense: Tense.indicativeFuture, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indFuture = conj
                }
                else if (tense == "Imperfect") {
                    let conj = Conjugations(tense: Tense.indicativeImperfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indImperfect = conj
                }
                else if (tense == "Preterite") {
                    let conj = Conjugations(tense: Tense.indicativePreterite, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indPreterite = conj
                }
                
                else if (tense == "Conditional") {
                    let conj = Conjugations(tense: Tense.indicativeConditional, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indConditional = conj
                }
                
                else if (tense == "Present Perfect") {
                    let conj = Conjugations(tense: Tense.indicativePresentPerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indPresentPerfect = conj
                }
                    
                else if (tense == "Future Perfect") {
                    let conj = Conjugations(tense: Tense.indicativeFuturePerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indFuturePerfect = conj
                }
                    
                else if (tense == "Past Perfect") {
                    let conj = Conjugations(tense: Tense.indicativePastPerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indPastPerfect = conj
                }
                
                else if (tense == "Preterite (Archaic)") {
                    let conj = Conjugations(tense: Tense.indicativePreteriteArchaic, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indPreteriteArchaic = conj
                }
                
                else if (tense == "Conditional Perfect") {
                    let conj = Conjugations(tense: Tense.indicativeConditionalPerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].indConditionalPerfect = conj
                }
            }
            
            else if (mood == "Subjuntive") {
                if (tense == "Present") {
                   let conj = Conjugations(tense: Tense.subjunctivePresent, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                   verbCompleteData[pos!].subPresent = conj
                }
                
                else if (tense == "Imperfect") {
                   let conj = Conjugations(tense: Tense.subjunctiveImperfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                   verbCompleteData[pos!].subImperfect = conj
                }
                
                else if (tense == "Future") {
                   let conj = Conjugations(tense: Tense.subjunctiveFuture, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                   verbCompleteData[pos!].subFuture = conj
                }
                
                else if (tense == "Present Perfect") {
                   let conj = Conjugations(tense: Tense.subjunctivePresentPerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                   verbCompleteData[pos!].subPresentPerfect = conj
                }
                
                else if (tense == "Future Perfect") {
                    let conj = Conjugations(tense: Tense.subjunctiveFuturePerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                    verbCompleteData[pos!].subFuturePerfect = conj
                }
                
                else if (tense == "Past Perfect") {
                   let conj = Conjugations(tense: Tense.subjunctivePastPerfect, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
                   verbCompleteData[pos!].subPastPerfect = conj
                }
            }
            
            else if (mood == "Imperative Afirmative") {
               let conj = Conjugations(tense: Tense.imperativeAffirmative, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
               verbCompleteData[pos!].imperativeAffirmative = conj
            }
            
            else if (mood == "Imperative Negative") {
               let conj = Conjugations(tense: Tense.imperativeNegative, s1: row[7], s2: row[8], s3: row[9], p1: row[10], p2: row[11], p3: row[12])
               verbCompleteData[pos!].imperativeNegative = conj
            }
        }
    }
    
    func getVerbData() -> [Verb] {
        self.parseCSVFile()
        self.parseVerbArray()
        return verbCompleteData
    }
    
    func getVerbsAlreadyInput() -> [String] {
        return verbsAlreadyInput
    }
}

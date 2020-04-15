//
//  Practice Session.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import Foundation

class Game: ObservableObject {
    var name: String
    var verbsToPractice = [String]()
    
    // Indicative Tenses Booleans
    var indPresent: Bool = false
    var indFuture: Bool = false
    var indImperfect: Bool = false
    var indPreterite: Bool = false
    var indConditional: Bool = false
    var indPresentPerfect: Bool = false
    var indFuturePerfect: Bool = false
    var indPastPerfect: Bool = false
    var indPreteriteArchaic: Bool = false
    var indConditionalPerfect: Bool = false
    
    // Subjunctive Tenses Booleans
    var subPresent: Bool = false
    var subImperfect: Bool = false
    var subFuture: Bool = false
    var subPresentPerfect: Bool = false
    var subFuturePerfect: Bool = false
    var subPastPerfect: Bool = false
    
    // Imperative Tenses Booleans
    var imperativeAffirmative: Bool = false
    var imperativeNegative: Bool = false
    
    // Question lists to help with the delivering of data to the user
    var questionList = [Question]()
    var questionsAnswered = [Question]()
    var questionsCorrect = [Question]()
    var questionsWrong = [Question]()
    @Published var currentQuestion: Question = Question() // Recognizes when currentQuestion is changed
    
    // initialize class with name parameter
    init(name: String = "Untitled Game") {
        self.name = name
    }
    
    // temporary test initializer
    init(str: String, bool: Bool, toPractice: [String]) {
        self.name = str
        self.indPresent = bool
        self.verbsToPractice = toPractice
    }
    
    // setsVerbsToPractice by taking in comma separated string and splitting into an array
    func setVerbsToPractice(verbs: [String]) -> Void {
        
        self.verbsToPractice = verbs
    }
    
    // sets user preference of tenses
    func setTenses(indPresent: Bool, indPreterite: Bool, subPresent: Bool, subImperfect: Bool, impAffirmative: Bool, impNegative: Bool) -> Void {
        self.indPresent = indPresent
        self.indPreterite = indPreterite
        self.subPresent = subPresent
        self.subImperfect = subImperfect
        self.imperativeAffirmative = impAffirmative
        self.imperativeNegative = impNegative
    }
    
    // creates Question instances based of tenses and verbsToPractice
    func createQuestions() -> Void {
        for i in 0..<verbsToPractice.count {
            let pos = verbList.firstIndex(of: verbsToPractice[i])!
            let curVerb = verbData[pos]
            
            if(indPresent) {
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePresent, form: .s1))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePresent, form: .s2))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePresent, form: .s3))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePresent, form: .p1))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePresent, form: .p2))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePresent, form: .p3))
            }
            if(indPreterite) {
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePreterite, form: .s1))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePreterite, form: .s2))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePreterite, form: .s3))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePreterite, form: .p1))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePreterite, form: .p2))
                questionList.append(Question(infinitive: curVerb.name, tense: .indicativePreterite, form: .p3))
            }
            if(subPresent) {
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctivePresent, form: .s1))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctivePresent, form: .s2))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctivePresent, form: .s3))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctivePresent, form: .p1))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctivePresent, form: .p2))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctivePresent, form: .p3))
            }
            if(subImperfect) {
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctiveImperfect, form: .s1))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctiveImperfect, form: .s2))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctiveImperfect, form: .s3))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctiveImperfect, form: .p1))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctiveImperfect, form: .p2))
                questionList.append(Question(infinitive: curVerb.name, tense: .subjunctiveImperfect, form: .p3))
            }
            if(imperativeAffirmative) {
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeAffirmative, form: .s1))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeAffirmative, form: .s2))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeAffirmative, form: .s3))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeAffirmative, form: .p1))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeAffirmative, form: .p2))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeAffirmative, form: .p3))
            }
            if(imperativeNegative) {
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeNegative, form: .s1))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeNegative, form: .s2))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeNegative, form: .s3))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeNegative, form: .p1))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeNegative, form: .p2))
                questionList.append(Question(infinitive: curVerb.name, tense: .imperativeNegative, form: .p3))
            }
        }
    }
    
    // scrambles questionList
    func scrambleQuestions() {
        questionList.shuffle()
    }
    
    //sets current Question with first value in questionList
    // then removes first value of questionList
    func nextQuestion() {
        self.currentQuestion = self.questionList.removeFirst()
    }
    
    /*
     Checks question
     Appends in questionsCorrect or questionsWrong arrays
     Appends in questionsAnswered array
     Returns value of checkQuestion
     */
    func checkQuestion(response: String) -> Bool{
        let ansBool = self.currentQuestion.checkCorrect(ans: response)
        if(ansBool) {
            questionsCorrect.append(self.currentQuestion)
        }
        else {
            questionsWrong.append(self.currentQuestion)
        }
        questionsAnswered.append(self.currentQuestion)
        return ansBool
    }
    
    // if the questionList count is zero, then game is over
    func isGameOver() -> Bool {
        return (self.questionList.count == 0)
    }
    
    func clearGame() {
        self.verbsToPractice = []
        self.questionList = []
        self.questionsAnswered = []
        self.questionsCorrect = []
        self.questionsWrong = []
        
    }
    
    // returns the percentage of questionsCorrect count vs questionsAnswered count
    func getScore() -> String {
        let myDouble =  Double(self.questionsCorrect.count) / Double(self.questionsAnswered.count) * 100
        let doubleStr = String(format: "%.2f", myDouble)
        return doubleStr + " %"
    }
}

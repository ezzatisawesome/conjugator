//
//  PracticeSession.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct PracticeSession: View {
    @Environment (\.presentationMode) var presentationMode
    @Binding var isLandingPageRootActive: Bool
    
    @State var game: Game
    @State var questionCount: Int = 1
    @State var userAnswer: String = ""
    @State var isEnterLinkActive: Bool = false
    @State var onRightWrong: Bool = false // Boolean telling if right or wrong image should be displayed
    @State var rightWrong: Bool = false // Boolean telling if user answer is right or wrong
    
    func checkUserAnswer() {
        if (self.game.isGameOver()) {
            let ans = self.game.checkQuestion(response: self.userAnswer.lowercased())
            self.rightWrong = ans
            self.onRightWrong = true
            
            self.isEnterLinkActive = true // Enables navigation link to move to next view
        }
        else {
            self.questionCount += 1
            let ans = self.game.checkQuestion(response: self.userAnswer.lowercased())
            self.rightWrong = ans
            self.game.nextQuestion()
            self.userAnswer.removeAll()
            self.onRightWrong = true
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(self.game.name)
                
                Spacer()
                
                Text("Question \(self.questionCount)")
                
                VStack(alignment: .leading) {
                    Text("Infinitive: \(self.game.currentQuestion.infinitive)")
                    Text("Tense: \(self.game.currentQuestion.tense.rawValue)")
                    Text("Form: \(self.game.currentQuestion.form.rawValue)")
                }.padding()
                
                TextField("Answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                VStack {
                    NavigationLink(destination: SessionEnd(isLandingPageRootActive: self.$isLandingPageRootActive, game: self.game), isActive: self.$isEnterLinkActive) {EmptyView()}.isDetailLink(false)

                    Button(action: {self.checkUserAnswer()},
                           label: {Text("Answer")}
                    )
                }
            }.padding()
            
            ans
            
            }
        }
        
        @ViewBuilder
        var ans: some View {
            if(self.onRightWrong) {
                if(self.rightWrong) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                        .onTapGesture{self.onRightWrong = false}
                }
                else {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                        .onTapGesture{self.onRightWrong = false}
                }
            }
        }
    }


struct LandingPage: View {
    @State var isLandingPageRootActive = false
    @State var set: PracticeSet
    @State var isLinkActive: Bool = false
    @State var game = Game()
    
    func setup() {
        game.setTenses(indPresent: self.set.indPresent, indPreterite: self.set.indPreterite, subPresent: self.set.subPresent, subImperfect: self.set.subImperfect, impAffirmative: self.set.impAffirmative, impNegative: self.set.impNegative)
        game.setVerbsToPractice(verbs: self.set.verbsToPractice)
        game.createQuestions()
        game.scrambleQuestions()
        game.nextQuestion()
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: PracticeSession(isLandingPageRootActive: self.$isLandingPageRootActive, game: self.game), isActive: self.$isLandingPageRootActive) {EmptyView()}.isDetailLink(false)
            Button(action: {
                    self.setup()
                    self.isLandingPageRootActive = true},
                   label: {Text("Continue")}
            )
        }
    }
}

struct PracticeSession_Previews {
    static var previews: some View {
        PracticeSession(isLandingPageRootActive: .constant(false), game: Game())
    }
}

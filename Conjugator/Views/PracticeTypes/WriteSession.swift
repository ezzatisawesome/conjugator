//
//  PracticeSession.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct WriteSession: View {
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
            self.game.currentQuestion.setUserAnswer(ans: self.userAnswer)
            let ans = self.game.checkQuestion(response: self.userAnswer.lowercased())
            self.rightWrong = ans
            self.onRightWrong = true
            self.isEnterLinkActive = true // Enables navigation link to move to next view
        }
        else {
            self.questionCount += 1
            self.game.currentQuestion.setUserAnswer(ans: self.userAnswer)
            let ans = self.game.checkQuestion(response: self.userAnswer.lowercased())
            self.rightWrong = ans
            self.game.nextQuestion()
            self.userAnswer.removeAll()
            self.onRightWrong = true
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Question \(self.questionCount)").font(.title)

                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Infinitive: \(self.game.currentQuestion.infinitive)")
                    Text("Tense: \(self.game.currentQuestion.tense.rawValue)")
                    Text("Form: \(self.game.currentQuestion.form.rawValue)")
                }.padding()
                
                TextField("Answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                VStack {
                    NavigationLink(destination: GameEnd(isLandingPageRootActive: self.$isLandingPageRootActive, game: self.game), isActive: self.$isEnterLinkActive) {EmptyView()}.isDetailLink(false)

                    Button(action: {self.checkUserAnswer()},
                           label: {Text("Answer")}
                    ).softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color.white, textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                     .frame(width: 100, height: 25)
                }
                
                Spacer()
                
            }.padding()
            
            ans
            
        }.navigationBarBackButtonHidden(true)
        .navigationBarTitle(self.game.name)
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

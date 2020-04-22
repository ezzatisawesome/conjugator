//
//  LandingPage.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/4/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct GameDetails: View {
    @Environment (\.presentationMode) var presentationMode
    @State var set: Deck
    @State var isLinkActive: Bool = false
    @State var game = Game()
    
    func setup(type: practiceType) -> Bool {
        switch type {
        case .write:
            game.setTenses(indPresent: self.set.indPresent, indPreterite: self.set.indPreterite, indFuture: self.set.indFuture, indImperfect: self.set.indImperfect, indConditional: self.set.indConditional, indPresentPerfect: self.set.indPresentPerfect, indFuturePerfect: self.set.indFuturePerfect, indPastPerfect: self.set.indPastPerfect, indPreteriteArchaic: self.set.indPreteriteArchaic, indConditionalPerfect: self.set.indConditionalPerfect, subPresent: self.set.subPresent, subImperfect: self.set.subImperfect, subFuture: self.set.subFuture, subPresentPerfect: self.set.subPresentPerfect, subFuturePerfect: self.set.subFuturePerfect, subPastPerfect: self.set.subPastPerfect, impAffirmative: self.set.impAffirmative, impNegative: self.set.impNegative)
            game.setVerbsToPractice(verbs: self.set.verbsToPractice)
            game.createQuestions()
            if(game.questionList.count == 0) {
                return false
            }
            game.scrambleQuestions()
            game.nextQuestion()
            return true
        case .flashcard:
            game.setTenses(indPresent: self.set.indPresent, indPreterite: self.set.indPreterite, indFuture: self.set.indFuture, indImperfect: self.set.indImperfect, indConditional: self.set.indConditional, indPresentPerfect: self.set.indPresentPerfect, indFuturePerfect: self.set.indFuturePerfect, indPastPerfect: self.set.indPastPerfect, indPreteriteArchaic: self.set.indPreteriteArchaic, indConditionalPerfect: self.set.indConditionalPerfect, subPresent: self.set.subPresent, subImperfect: self.set.subImperfect, subFuture: self.set.subFuture, subPresentPerfect: self.set.subPresentPerfect, subFuturePerfect: self.set.subFuturePerfect, subPastPerfect: self.set.subPastPerfect, impAffirmative: self.set.impAffirmative, impNegative: self.set.impNegative)
            game.setVerbsToPractice(verbs: self.set.verbsToPractice)
            game.createQuestions()
            if(game.questionList.count == 0) {
                return false
            }
        case .multipleChoice:
            game.setTenses(indPresent: self.set.indPresent, indPreterite: self.set.indPreterite, indFuture: self.set.indFuture, indImperfect: self.set.indImperfect, indConditional: self.set.indConditional, indPresentPerfect: self.set.indPresentPerfect, indFuturePerfect: self.set.indFuturePerfect, indPastPerfect: self.set.indPastPerfect, indPreteriteArchaic: self.set.indPreteriteArchaic, indConditionalPerfect: self.set.indConditionalPerfect, subPresent: self.set.subPresent, subImperfect: self.set.subImperfect, subFuture: self.set.subFuture, subPresentPerfect: self.set.subPresentPerfect, subFuturePerfect: self.set.subFuturePerfect, subPastPerfect: self.set.subPastPerfect, impAffirmative: self.set.impAffirmative, impNegative: self.set.impNegative)
            game.setVerbsToPractice(verbs: self.set.verbsToPractice)
            game.createQuestions()
            if(game.questionList.count == 0) {
                return false
            }
            game.scrambleQuestions()
            game.nextQuestion()
            return true
        }
        return false
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(self.set.wrappedName).font(.largeTitle).bold()
                HStack {
                    VStack {
                        Text("Verbs Used").font(.headline)
                        List {
                            ForEach(self.set.verbsToPractice, id: \.self) { verb in
                                Text(verb)
                            }
                        }.frame(width: geometry.size.width/2.1)
                        .cornerRadius(20)
                    }
                    
                    self.tensesUsed.frame(width: geometry.size.width/2.1)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height/2.1)
                .padding()
                
                Divider()
                
                VStack(alignment: .center, spacing: 50) {
                    Text("Practice").font(.largeTitle)
                    
                    self.writeButton
                    self.multipleChoiceButton
                    self.flashcardButton
                    
                    Spacer()
                    
                }.frame(width: geometry.size.width, height: geometry.size.height/2.1)
                .padding()
                
            }.padding()
        }
    }
    
    @State var showingAlert = false
    @State var writeButtonRoot = false
    var writeButton: some View {
        VStack {
            NavigationLink(destination: WriteSession(isLandingPageRootActive: self.$writeButtonRoot, game: self.game), isActive: self.$writeButtonRoot) {EmptyView()}.isDetailLink(false)
            Button(
                action: {
                    if(!self.setup(type: .write)) {
                        self.showingAlert.toggle()
                    }
                    self.writeButtonRoot.toggle()},
                   label: {Text("Write")}
            ).softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("No cards in deck!"), message: Text("Edit the combination of verbs and tenses input in this deck for the program to add cards."), dismissButton: .default(Text("Continue")))
            }
            .frame(width: 290, height: 30)
        }
    }
    
    @State var multipleChoiceRoot = false
    var multipleChoiceButton: some View {
        VStack {
            NavigationLink(destination: Text("Coming Soon"), isActive: self.$multipleChoiceRoot)
                {EmptyView()}.isDetailLink(false)
            
            Button(action: {self.multipleChoiceRoot.toggle()}) {
                Text("Mutliple Choice")
            }.softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
            .frame(width: 290, height: 30)
        }
    }
    
    @State var flashcardRoot = false
    var flashcardButton: some View {
        VStack {
            NavigationLink(destination: FlashCardSession(game: self.game, currentQuestion: self.game.questionList[0]), isActive: self.$flashcardRoot)
                {EmptyView()}.isDetailLink(false)
            
            Button(
                action: {
                    self.flashcardRoot.toggle()
                    if(!self.setup(type: .write)) {
                        self.showingAlert.toggle()
                    }
                },
                label: {Text("Flashcards")}
            ).softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("No cards in deck!"), message: Text("Edit the combination of verbs and tenses input in this deck for the program to add cards."), dismissButton: .default(Text("Continue")))}
            .frame(width: 290, height: 30)
        }
    }
    
    var tensesUsed: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Tense to Practice:").font(.headline)
            
            VStack(alignment: .leading) {
                if(self.set.indPresent) {
                    Text("Indicative Present").font(.subheadline)
                }
                if(self.set.indPreterite) {
                    Text("Indicative Preterite").font(.subheadline)
                }
                if(self.set.indImperfect) {
                    Text("Indicative Imperfect").font(.subheadline)
                }
                if(self.set.indFuture) {
                    Text("Indicative Future").font(.subheadline)
                }
                if(self.set.indConditional) {
                    Text("Indicative Conditional").font(.subheadline)
                }
                if(self.set.indPresentPerfect) {
                    Text("Indicative Present Perfect").font(.subheadline)
                }
                if(self.set.indPastPerfect) {
                    Text("Indicative Past Perfect").font(.subheadline)
                }
                if(self.set.indFuturePerfect) {
                    Text("Indicative Future Perfect").font(.subheadline)
                }
                if(self.set.indConditionalPerfect) {
                    Text("Indicative Conditional Perfect").font(.subheadline)
                }
                if(self.set.indPreteriteArchaic) {
                    Text("Indicative Preterite Archaic").font(.subheadline)
                }
            }
            
            VStack(alignment: .leading) {
                if(self.set.subPresent) {
                    Text("Subjunctive Present").font(.subheadline)
                }
                if(self.set.subImperfect) {
                    Text("Subjunctive Imperfect").font(.subheadline)
                }
                if(self.set.subFuture) {
                    Text("Subjunctive Future").font(.subheadline)
                }
                if(self.set.subPresentPerfect) {
                    Text("Subjunctive Present Perfect").font(.subheadline)
                }
                if(self.set.subPastPerfect) {
                    Text("Subjunctive Past Perfect").font(.subheadline)
                }
                if(self.set.subFuturePerfect) {
                    Text("Subjunctive Future Perfect").font(.subheadline)
                }
            }
            
            VStack(alignment: .leading) {
                if(self.set.impAffirmative) {
                    Text("Imperative Affirmative").font(.subheadline)
                }
                if(self.set.impNegative) {
                    Text("Imperative Affirmative").font(.subheadline)
                }
            }
            Spacer()
        }
    }
}

enum practiceType: String {
    case write = "Write"
    case flashcard = "Flashcard"
    case multipleChoice = "Multiple Choice"
}

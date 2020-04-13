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
    @State var isLandingPageRootActive = false
    @State var set: Deck
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
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Tense to Practice:").font(.headline)
                        if(self.set.indPresent) {
                            Text("Indicative Present").font(.subheadline)
                        }
                        if(self.set.indPreterite) {
                            Text("Indicative Preterite").font(.subheadline)
                        }
                        if(self.set.subPresent) {
                            Text("Subjunctive Present").font(.subheadline)
                        }
                        if(self.set.subImperfect) {
                            Text("Subjunctive Imperfect").font(.subheadline)
                        }
                        if(self.set.impAffirmative) {
                            Text("Imperative Affirmative").font(.subheadline)
                        }
                        if(self.set.indPresent) {
                            Text("Imperative Affirmative").font(.subheadline)
                        }
                        Spacer()
                    }.frame(width: geometry.size.width/2.1)
                }.frame(width: geometry.size.width, height: geometry.size.height/2.1)
                .padding()
                
                Divider()
                
                VStack(alignment: .center, spacing: 50) {
                    Text("Practice").font(.largeTitle)
                    VStack {
                        NavigationLink(destination: GameSession(isLandingPageRootActive: self.$isLandingPageRootActive, game: self.game), isActive: self.$isLandingPageRootActive) {EmptyView()}.isDetailLink(false)
                        Button(action: {
                                self.setup()
                                self.isLandingPageRootActive = true},
                               label: {Text("Write")}
                        ).softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                        .frame(width: 290, height: 30)
                    }
                                        
                    Button(action: {}) {
                        Text("Mutliple Choice")
                    }.softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                    .frame(width: 290, height: 30)
                    
                    Button(action: {}) {
                        Text("Flashcards")
                    }.softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                    .frame(width: 290, height: 30)
                    
                    Spacer()
                    
                }.frame(width: geometry.size.width, height: geometry.size.height/2.1)
                .padding()
                
            }.padding()
        }
    }
}

//
//  GameSetup.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct GameSetup: View {
    @Binding var rootIsActive: Bool
    @ObservedObject var practiceSet = Game()
    
    @State var verbsToPractice = ""
    @State var indPresent: Bool = false
    @State var indPreterite: Bool = false
    @State var subPresent: Bool = false
    @State var subImperfect: Bool = false
    @State var affirmative: Bool = false
    @State var negative: Bool = false
    
    @State var isActive: Bool = false // for the Create button
    
    func gameSetup() {
        //self.practiceSet.setVerbsToPractice(verbs: self.verbsToPractice.lowercased())
        self.practiceSet.setTenses(indPresent: self.indPresent, indPreterite: self.indPreterite, subPresent: self.subPresent, subImperfect: self.subImperfect, impAffirmative: self.affirmative, impNegative: self.negative)
        
        self.practiceSet.createQuestions()
        
        self.practiceSet.scrambleQuestions()
        self.practiceSet.nextQuestion()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Setup \(practiceSet.name)")
                    .font(.title)
                    .fontWeight(.heavy)
                HStack {
                    VStack{
                        Text("Indicative")
                        Button(action: {self.indPresent.toggle()},
                               label: {Text("Present"); Image(systemName: self.indPresent ? "checkmark.square" : "square")}
                        )
                        Button(action: {self.indPreterite.toggle()},
                               label: {Text("Preterite"); Image(systemName: self.indPreterite ? "checkmark.square" : "square")}
                        )
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Subjunctive")
                        Button(action: {self.subPresent.toggle()},
                               label: {Text("Present"); Image(systemName: self.subPresent ? "checkmark.square" : "square")}
                        )
                        Button(action: {self.subImperfect.toggle()},
                               label: {Text("Present"); Image(systemName: self.subImperfect ? "checkmark.square" : "square")}
                        )
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Imperative")
                        Button(action: {self.affirmative.toggle()},
                               label: {Text("Present"); Image(systemName: self.affirmative ? "checkmark.square" : "square")}
                        )
                        Button(action: {self.negative.toggle()},
                               label: {Text("Present"); Image(systemName: self.negative ? "checkmark.square" : "square")}
                        )
                    }
                    
                }.padding()
                
                List {
                    ForEach(verbData) { verb in
                        Button(action: {
                            self.verbsToPractice = self.verbsToPractice + verb.name + ","
                        }) {
                            Text(verb.name)
                        }
                    }
                }.scaledToFit()
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                
                TextField("Name's placeholder", text: $verbsToPractice)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                /*
                VStack {
                    NavigationLink(destination: Questions(rootIsActive: self.$rootIsActive, testGame: self.practiceSet), isActive: self.$isActive) {EmptyView()}.isDetailLink(false)

                    Button(action: {self.gameSetup(); self.isActive = true},
                           label: {Text("Enter")}
                    )
                }
 */
                
            }.padding()
        }
    }
}

struct GameSetup_Previews: PreviewProvider {
    static var previews: some View {
        GameSetup(rootIsActive: .constant(false), practiceSet: Game())
    }
}

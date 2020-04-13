//
//  SessionEnd.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct GameEnd: View {
    @Binding var isLandingPageRootActive: Bool
    @ObservedObject var game: Game
    
    var body: some View {
        VStack {
            self.score
            Text("Answer List").font(.headline)
            self.questionList
            self.backButton
            Spacer()
        }.navigationBarBackButtonHidden(true)
         .padding()
    }
    
    var score: some View {
        VStack {
            Text("Completed").font(.largeTitle)
            Text("Score: \(self.game.getScore())")
        }
    }
    
    var questionList: some View {
        List {
            ForEach(game.questionsAnswered, id: \.self) { question in
                HStack {
                    Text("\(question.infinitive);")
                    Text("\(question.tense.rawValue);")
                    Text("\(question.form.rawValue);")
                    Text("\(question.conjugated) -")
                    Text("\(question.wrappedUserAnswer)")
                }
            }
            }.cornerRadius(10)
             .padding()
             .listStyle(GroupedListStyle())
             .environment(\.horizontalSizeClass, .regular)
    }
    
    
    var backButton: some View {
        Button (action: {self.game.clearGame(); self.isLandingPageRootActive = false}) {
            Text("Back To Landing Page")
        }.softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
            .frame(width: 290, height: 30)
    }
}

struct SessionEnd_Previews: PreviewProvider {
    static var previews: some View {
        GameEnd(isLandingPageRootActive: .constant(false), game: Game())
    }
}

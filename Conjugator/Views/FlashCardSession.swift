//
//  flashCards.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/19/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct FlashCardSession: View {
    @State var game: Game
    @State var cardNumber: Int = 0
    @State var currentQuestion: Question
    
    var body: some View {
        VStack {
            Text("\(self.cardNumber)")
            HStack {
                Button(action: {
                        if(self.cardNumber == 0) {
                            self.cardNumber = 0
                        }
                        else {
                            self.cardNumber -= 1
                        }
                        self.currentQuestion = self.game.questionList[self.cardNumber]
                        },
                       label: {Image(systemName: "chevron.left")}
                ).padding()
                
                Spacer()
                
                SimpleFlipper(question: self.$currentQuestion)
                
                Spacer()
                
                Button(action: {
                        if(self.cardNumber == self.game.questionList.count-1) {
                            self.cardNumber = self.game.questionList.count-1
                        }
                        else {
                            self.cardNumber += 1
                        }
                        self.currentQuestion = self.game.questionList[self.cardNumber]},
                       label: {Image(systemName: "chevron.right")}
                ).padding()
            }
        }.navigationBarTitle(self.game.name)
    }
}

struct SimpleFlipper : View {
    @Binding var question: Question
    @State var flipped = false

    var body: some View {

        let flipDegrees = flipped ? 180.0 : 0

        return VStack{
                Spacer()

                ZStack() {
                    Text(question.infinitive).placedOnCard(Color.yellow).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                    Text(question.conjugated).placedOnCard(Color.blue).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
                }
                .animation(.easeInOut(duration: 0.8))
                .onTapGesture { self.flipped.toggle() }
                Spacer()
        }
    }
}

extension View {

      func flipRotate(_ degrees : Double) -> some View {
            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
      }

      func placedOnCard(_ color: Color) -> some View {
            return padding(5).frame(width: 250, height: 150, alignment: .center).background(color)
      }
}

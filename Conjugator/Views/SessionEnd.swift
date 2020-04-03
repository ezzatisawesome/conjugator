//
//  SessionEnd.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct SessionEnd: View {
    @Binding var isLandingPageRootActive: Bool
    @ObservedObject var game: Game
    
    var body: some View {
        VStack {
            Text("Completed").font(.largeTitle)
            Text("Score: \(self.game.getScore())")
            
            Spacer()
            
            Button (action: { self.isLandingPageRootActive = false }) {
                Text("Back To Landing Page")
            }
        }
    .navigationBarBackButtonHidden(true)
    }
}

struct SessionEnd_Previews: PreviewProvider {
    static var previews: some View {
        SessionEnd(isLandingPageRootActive: .constant(false), game: Game())
    }
}

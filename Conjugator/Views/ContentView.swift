//
//  ContentView.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isRootActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Conjugator").font(.largeTitle)
                Text("Para Español").font(.title)
                
                Spacer()
                
                NavigationLink(destination: PracticeSetList(isRootActive: self.$isRootActive), isActive: self.$isRootActive) {
                    Text("Practice List")
                }.isDetailLink(false)
                
                NavigationLink(destination: Dictionary()) {
                    Text("Dictionary")
                }
                
                NavigationLink(destination: Helper()) {
                    Text("Help")
                }
                
                Spacer()
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

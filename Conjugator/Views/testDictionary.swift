//
//  testDictionary.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/4/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct testDictionary: View {
    @State var isDetailActive = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack {
                    ForEach(verbData) {
                        verb in NavigationLink(destination: DictionaryDetail(verb: verb), isActive: self.$isDetailActive) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(.white))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 40)
                                    .modifier(Neumorphic())
                                    /// Opens DictionaryDetail page
                                    .onTapGesture{
                                        self.isDetailActive = true
                                    }
                                Text(verb.name)
                            }.padding([.leading, .trailing], 10)
                        }
                    }
                }
            }
        }.navigationBarTitle("Dictionary")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct testDictionary_Previews: PreviewProvider {
    static var previews: some View {
        testDictionary()
    }
}

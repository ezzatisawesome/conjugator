//
//  ContentView.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI
import Neumorphic

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: PracticeSet.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \PracticeSet.name, ascending: true)]
    ) var sets: FetchedResults<PracticeSet>
    
    @State var isRootActive = false
    @State var isDictionaryActive = false
    @State var isHelperActive = false
    @State var isQuickAccessActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.white, Color("Background")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack {
                        Text("Conjugator")
                            .fontWeight(.heavy)
                            .font(.system(size: 60))
                            .kerning(5)
                        Text("Para Español")
                            .font(.system(size:40))
                            .kerning(5)
                    }.padding(.bottom, 50)

                    
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: PracticeSetList(isRootActive: self.$isRootActive), isActive: self.$isRootActive) {
                            EmptyView()
                        }.isDetailLink(false)
                        
                        Button(action: {self.isRootActive = true},
                               label: {Text("Practice").fontWeight(.bold)}
                        ).softButtonStyle(RoundedRectangle(cornerRadius: 20))
                    }.frame(width: 220, height: 50)
                    .padding(.bottom, 20)

                    
                    ZStack {
                        NavigationLink(destination: Dictionary(), isActive: self.$isDictionaryActive) {
                            EmptyView()
                        }.isDetailLink(false)
                        
                        Button(action: {self.isDictionaryActive = true},
                               label: {Text("Dictionary").fontWeight(.bold)}
                        ).softButtonStyle(RoundedRectangle(cornerRadius: 20))
                    }.frame(width: 180, height: 50)
                    .padding(.bottom, 20)
                    
                    ZStack {
                        NavigationLink(destination: Helper(), isActive: self.$isHelperActive) {
                            EmptyView()
                        }.isDetailLink(false)
                        
                        Button(action: {self.isHelperActive = true},
                               label: {Text("Helper").fontWeight(.bold)}
                        ).softButtonStyle(RoundedRectangle(cornerRadius: 20))
                    }.frame(width: 180, height: 50)
                    .padding(.bottom, 50)
                    
                    Spacer()
                    
                    Text("Quick Access")
                    List {
                        ForEach(sets) {
                            set in VStack {
                                NavigationLink(destination: LandingPage(set: set)) {
                                    Text(set.name)
                                }
                            }
                        }
                    }.listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .modifier(Neumorphic())
                    
                }.padding()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

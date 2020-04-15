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
    @FetchRequest(entity: Deck.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Deck.name, ascending: true)]
    ) var decks: FetchedResults<Deck>
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader{geometry in
                HStack {
                    VStack(alignment: .leading, spacing: geometry.size.height/22) {
                        self.title.padding()
                        self.dictionaryButton.frame(height: geometry.size.height/20)
                        self.helperButton.frame(height: geometry.size.height/20)
                        Spacer()
                    }.frame(width: geometry.size.width/3)
                     
                    
                    Divider()
                    
                    VStack {
                        Text("Decks").font(.title).underline().kerning(2)
                        self.deckList
                    }.navigationBarItems(trailing: EditButton())
                }
            }.navigationBarTitle("Conjugations")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var title: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Para").font(.largeTitle).kerning(5)
            Text("Español").font(.largeTitle).kerning(5)
        }
    }
    
    var deckList: some View {
        List {
            ForEach(decks) { deck in
                NavigationLink(destination: GameDetails(set: deck)) {
                    //Text(deck.wrappedName).font(.title)
                    deckView(deck: deck)
                }
            }.onDelete(perform: removeDeck)
            //.listRowBackground(Color("Background"))
             
            VStack {
                NavigationLink(destination: NewDeckView()) {
                    HStack {
                        Text("New Deck")
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }.cornerRadius(20)
        .padding()
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
    
    @State var dictionaryActive = false
    var dictionaryButton: some View {
        GeometryReader { geo in
            VStack {
                NavigationLink(destination: Dictionary(), isActive: self.$dictionaryActive) {EmptyView()}
                Button(action: {self.dictionaryActive.toggle()},
                       label: {Text("Dictionary")})
                .softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                    .frame(width: geo.size.width/1.1)
            }.frame(height: geo.size.height)
        }
    }
    
    @State var helperActive = false
    var helperButton: some View {
        GeometryReader { geo in
            VStack {
                NavigationLink(destination: Helper(), isActive: self.$helperActive) {EmptyView()}
                Button(action: {self.helperActive.toggle()},
                       label: {Text("Helper")})
                .softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                    .frame(width: geo.size.width/1.1)
            }
        }
    }
    
    func removeDeck(at offsets: IndexSet) {
        for index in offsets {
            let deck = decks[index]
            managedObjectContext.delete(deck)
        }
        do {
            try managedObjectContext.save()
            
        } catch {
            // handle the Core Data error
        }
    }
}

struct deckView: View {
    @State var deck: Deck
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 15).fill(Color(.white)).modifier(Neumorphic())
                Text(deck.wrappedName).font(.caption)
            }.frame(width: 72, height: 120)
            Text("Number of Verbs: \(deck.verbsToPractice.count)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

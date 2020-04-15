//
//  NewSetup.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct NewDeckView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var newPracticeSet = Game()
    
    @State var name = ""
    @State var verbsToPractice = [String]()
    @State var indPresent: Bool = false
    @State var indPreterite: Bool = false
    @State var indFuture: Bool = false
    @State var indImperfect: Bool = false
    @State var indConditional: Bool = false
    @State var indPresentPerfect: Bool = false
    @State var indFuturePerfect: Bool = false
    @State var indPastPerfect: Bool = false
    @State var indPreteriteArchaic: Bool = false
    @State var indConditionalPerfect: Bool = false
    
    @State var subPresent: Bool = false
    @State var subImperfect: Bool = false
    @State var subFuture: Bool = false
    @State var subPresentPerfect: Bool = false
    @State var subFuturePerfect: Bool = false
    @State var subPastPerfect: Bool = false
    
    @State var impAffirmative: Bool = false
    @State var impNegative: Bool = false
    //@State var groupChoice: Group?
    
    @State var isActive: Bool = false // for the Create button
    
    func upload() {
        let newSet = Deck(context: self.managedObjectContext)
        
        newSet.name = self.name
        newSet.verbsToPractice = self.verbsToPractice
        newSet.indPresent = self.indPresent
        newSet.indPreterite = self.indPreterite
        newSet.subPresent = self.subPresent
        newSet.subImperfect = self.subImperfect
        newSet.impAffirmative = self.impAffirmative
        newSet.impNegative = self.impNegative
        //newSet.group = self.groupChoice
        newSet.id = UUID()
        
        do {
            try self.managedObjectContext.save()
            print("Order saved.")
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        Text("Set Title:")
                        TextField("Untitled Set", text: self.$name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    }
                        
                    HStack(alignment: .top) {
                        VStack(alignment: .leading){
                            Text("Indicative")
                            Button(action: {self.indPresent.toggle()},
                                   label: {Image(systemName: self.indPresent ? "checkmark.square" : "square"); Text("Present")}
                            )
                            Button(action: {self.indPreterite.toggle()},
                                   label: {Image(systemName: self.indPreterite ? "checkmark.square" : "square"); Text("Preterite")}
                            )
                            Button(action: {self.indImperfect.toggle()},
                                   label: {Image(systemName: self.indImperfect ? "checkmark.square" : "square"); Text("Imperfect")}
                            )
                            Button(action: {self.indFuture.toggle()},
                                   label: {Image(systemName: self.indFuture ? "checkmark.square" : "square"); Text("Future")}
                            )
                            Button(action: {self.indConditional.toggle()},
                                   label: {Image(systemName: self.indConditional ? "checkmark.square" : "square"); Text("Conditional")}
                            )
                            VStack(alignment: .leading) {
                                Button(action: {self.indPresentPerfect.toggle()},
                                       label: {Image(systemName: self.indPresentPerfect ? "checkmark.square" : "square"); Text("Present Perfect")}
                                )
                                Button(action: {self.indPastPerfect.toggle()},
                                       label: {Image(systemName: self.indPastPerfect ? "checkmark.square" : "square"); Text("Past Perfect")}
                                )
                                Button(action: {self.indFuturePerfect.toggle()},
                                       label: {Image(systemName: self.indFuturePerfect ? "checkmark.square" : "square"); Text("Future Perfect")}
                                )
                                Button(action: {self.indConditionalPerfect.toggle()},
                                       label: {Image(systemName: self.indConditionalPerfect ? "checkmark.square" : "square"); Text("Conditional Perfect")}
                                )
                                Button(action: {self.indPreteriteArchaic.toggle()},
                                       label: {Image(systemName: self.indPreteriteArchaic ? "checkmark.square" : "square"); Text("Preterite Archaic")}
                                )
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Subjunctive")
                            Button(action: {self.subPresent.toggle()},
                                   label: {Image(systemName: self.subPresent ? "checkmark.square" : "square"); Text("Present")}
                            )
                            Button(action: {self.subImperfect.toggle()},
                                   label: {Image(systemName: self.subImperfect ? "checkmark.square" : "square"); Text("Imperfect")}
                            )
                            Button(action: {self.subFuture.toggle()},
                                   label: {Image(systemName: self.subFuture ? "checkmark.square" : "square"); Text("Future")}
                            )
                            Button(action: {self.subPresentPerfect.toggle()},
                                   label: {Image(systemName: self.subPresentPerfect ? "checkmark.square" : "square"); Text("Present Perfect")}
                            )
                            Button(action: {self.subPastPerfect.toggle()},
                                   label: {Image(systemName: self.subPastPerfect ? "checkmark.square" : "square"); Text("Past Perfect")}
                            )
                            Button(action: {self.subFuturePerfect.toggle()},
                                   label: {Image(systemName: self.subFuturePerfect ? "checkmark.square" : "square"); Text("Future Perfect")}
                            )
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Imperative")
                            Button(action: {self.impAffirmative.toggle()},
                                   label: {Image(systemName: self.impAffirmative ? "checkmark.square" : "square"); Text("Present")}
                            )
                            Button(action: {self.impNegative.toggle()},
                                   label: {Image(systemName: self.impNegative ? "checkmark.square" : "square"); Text("Present")}
                            )
                        }
                        
                        
                    }.padding()
                    
                    List {
                        ForEach(verbData) { verb in
                            Button(action: {
                                //self.verbsToPractice = self.verbsToPractice + verb.name
                                self.verbsToPractice.append(verb.name)
                            }) {
                                Text(verb.name)
                            }
                        }
                    }.cornerRadius(20)
                    .frame(height: geometry.size.height/4)
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .padding()
                    
                    VStack {
                        Divider()
                        Text("Verbs to Practice").font(.headline)
                        List {
                            ForEach(self.verbsToPractice, id: \.self) { inputVerbs in
                                Text(inputVerbs)
                            }.onDelete(perform: self.deleteRow)
                        }.cornerRadius(20)
                        .frame(height: geometry.size.height/4)
                        .listStyle(GroupedListStyle())
                        .environment(\.horizontalSizeClass, .regular)
                    }.padding()
                    
                    Button(
                        action: {self.upload()},
                        label: {Text("Enter")}
                    ).softButtonStyle(RoundedRectangle(cornerRadius: 10), mainColor: Color("Background"), textColor: Color.black, darkShadowColor: Color("DarkShadow"), lightShadowColor: Color("LightShadow"))
                        .frame(width: 150, height: 30)
                    .padding()
                }.padding()
            }
        }
    }
    private func deleteRow(at indexSet: IndexSet) {
        self.verbsToPractice.remove(atOffsets: indexSet)
    }
}

struct NewSetSetup_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckView()
    }
}

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
    @State var verbsToPractice = ""
    @State var indPresent: Bool = false
    @State var indPreterite: Bool = false
    @State var subPresent: Bool = false
    @State var subImperfect: Bool = false
    @State var impAffirmative: Bool = false
    @State var impNegative: Bool = false
    //@State var groupChoice: Group?
    
    @State var isActive: Bool = false // for the Create button
    
    func upload() {
        let newSet = Deck(context: self.managedObjectContext)
        let verbsArray = verbsToPractice.components(separatedBy: ",")
        
        newSet.name = self.name
        newSet.verbsToPractice = verbsArray
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
        ScrollView {
                VStack {
                    /*
                    Picker("Group", selection: self.$groupChoice) {
                        ForEach(self.groups) { group in
                            Text(group.name).tag(group)
                        }
                    }.pickerStyle(WheelPickerStyle())
                    */
                    TextField("Untitled Set", text: self.$name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
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
                            Button(action: {self.impAffirmative.toggle()},
                                   label: {Text("Present"); Image(systemName: self.impAffirmative ? "checkmark.square" : "square")}
                            )
                            Button(action: {self.impNegative.toggle()},
                                   label: {Text("Present"); Image(systemName: self.impNegative ? "checkmark.square" : "square")}
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
                    }.cornerRadius(20)
                    .scaledToFit()
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    
                    
                    TextField("Enter verbs or choose verbs from dictionary", text: self.$verbsToPractice)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(
                        action: {
                            self.upload()
                        },
                        label: {Text("Enter")}
                    )
                    
                }.padding()
            }
        }
    }


struct NewSetSetup_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckView()
    }
}

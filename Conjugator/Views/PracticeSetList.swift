//
//  PracticeSetList.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI
import Neumorphic

struct PracticeSetList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: PracticeSet.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \PracticeSet.name, ascending: true)]
    ) var sets: FetchedResults<PracticeSet>
    
    @Binding var isRootActive: Bool
    @State var isActive = false
    @State var isActiveSets = false
    @State var isSheet = false
    @State var isEdit = false
    
    func deleteSet(_ index: Int) {
        if(index == -1) {
            return
        }
        else {
            managedObjectContext.delete(sets[index])
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            
        }
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.white, Color("Background")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all) // background colors

            VStack {
                // Horizontal scroll view of sets
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        
                        /// Link to create new set
                        VStack {
                            NavigationLink(destination: NewPracticeSet(), isActive: self.$isActive) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15.0)
                                        .fill(Color(.white))
                                        .frame(width:150, height: 250)
                                        .modifier(Neumorphic())
                                        /// Opens up setup
                                        .onTapGesture{
                                            self.isActive = true
                                        }
                                    VStack(alignment: .center){
                                        Text("New Set")
                                            

                                        Image(systemName: "plus.circle")
                                    }
                                }
                            }
                        }
                        
                        /**
                         * Links to set's landing pages and editing views
                         */
                        ForEach(sets) {
                            set in NavigationLink(destination: LandingPage(set: set), isActive: self.$isActiveSets) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15.0)
                                        .fill(Color(.white))
                                        .frame(width: 150, height: 250)
                                        .modifier(Neumorphic())
                                        /// Opens landing page
                                        .onTapGesture{
                                            self.isActiveSets = true
                                        }
                                        /// Opens up editing sheet
                                        .onLongPressGesture {
                                            self.isSheet = true
                                        }.actionSheet(isPresented:self.$isSheet) {
                                            ActionSheet(title: Text(set.name), message: Text("Edit or Delete"), buttons: [
                                                    .default(Text("Edit")) {self.isEdit = true},
                                                    .destructive(Text("Delete")) {self.deleteSet(self.sets.firstIndex(of: set) ?? -1)},
                                                    .cancel()
                                                ]
                                            )
                                        }
                                    /// name of current set
                                    Text(set.name)
                                }
                            }
                        }
                    }
                }.padding()
            }
        }.navigationBarTitle("Card Sets")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PracticeSetList_Previews: PreviewProvider {
    static var previews: some View {
        PracticeSetList(isRootActive: .constant(false))
    }
}

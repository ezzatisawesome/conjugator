//
//  backup.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/4/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

/*
 @Environment(\.managedObjectContext) var managedObjectContext
 @FetchRequest(entity: PracticeSet.entity(),
               sortDescriptors: [NSSortDescriptor(keyPath: \PracticeSet.name, ascending: true)]
 ) var sets: FetchedResults<PracticeSet>
 @FetchRequest(entity: Group.entity(),
               sortDescriptors: [NSSortDescriptor(keyPath: \Group.name, ascending: true)]
 ) var groups: FetchedResults<Group>
 
 @Binding var isRootActive: Bool
 @State var newGroupName = ""
 @State var isActive = false
 @State var isActiveSets = false
 @State var isSheet = false
 @State var isGroupSheet = false
 @State var isEdit = false
 @State var isNewGroupActive = false
 
 func addGroup(name: String) {
     let newGroup = Group(context: self.managedObjectContext)
     newGroup.name = name
     newGroup.id = UUID()
     do {
         try self.managedObjectContext.save()
         print("Order saved.")
     } catch {
         print(error.localizedDescription)
     }
 }
 
 func deleteGroup(_ index: Int) {
     if(index == -1) {
         return
     }
     else {
         managedObjectContext.delete(groups[index])
     }
     
     do {
         try managedObjectContext.save()
     } catch {
         
     }
 }
 
 func deleteSet(_ index: Int) {
     managedObjectContext.delete(sets[index])
     
     do {
         try managedObjectContext.save()
     } catch {
         
     }
 }
 
 var body: some View {
     ZStack {
         
         LinearGradient(gradient: Gradient(colors: [.white, Color("Background")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all) // background colors

         VStack {
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
                                                     .destructive(Text("Delete")) {
                                                         print("\(set.name) \(self.sets.firstIndex(of: set) ?? -1)")},
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
             
             VStack {
                 ScrollView(.vertical) {
                     VStack(spacing: 20) {
                         Button(action: {self.isNewGroupActive.toggle()},
                                label:{Text("New Group")}
                         )
                         ForEach(groups) {
                             group in Text(group.name)
                                 .font(.headline)
                                 .padding()
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 15)
                                         .stroke(lineWidth: 2))
                                         .onLongPressGesture {
                                             self.isGroupSheet = true
                                         }.actionSheet(isPresented:self.$isGroupSheet) {
                                             ActionSheet(title: Text(group.name), message: Text("Delete Game"), buttons: [
                                         .destructive(Text("Delete")) {self.deleteGroup(self.groups.firstIndex(of: group) ?? -1)},
                                         .cancel()])
                                         }
                         }
                     }
                 }
             }
         }
         
         if(self.isNewGroupActive) {
             getNewGroupNameFromUser
         }
         
     }.navigationBarTitle("Card Sets")
     .navigationViewStyle(StackNavigationViewStyle())
 }
 
 var getNewGroupNameFromUser: some View {
     ZStack {
         RoundedRectangle(cornerRadius: 5)
             .fill(Color(.white))
             
         VStack() {
             TextField("New Group", text: self.$newGroupName)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding()
             HStack {
                 Spacer()
                 Button(action: {
                         self.addGroup(name: self.newGroupName)
                         self.isNewGroupActive.toggle()},
                        label: {Text("Create")}
                 )
                 Spacer()
                 Button(action: {self.isNewGroupActive.toggle()},
                        label: {Text("Cancel").foregroundColor(.red)}
                 )
                 Spacer()
             }
         }
     }.frame(width: 230, height: 150)
 }
 
 var getNewGroupNameFromUser: some View {
     ZStack {
         RoundedRectangle(cornerRadius: 5)
             .fill(Color(.white))
             
         VStack() {
             TextField("New Group", text: self.$newGroupName)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding()
             HStack {
                 Spacer()
                 Button(action: {
                         self.addGroup(name: self.newGroupName)
                         self.isNewGroupActive.toggle()},
                        label: {Text("Create")}
                 )
                 Spacer()
                 Button(action: {self.isNewGroupActive.toggle()},
                        label: {Text("Cancel").foregroundColor(.red)}
                 )
                 Spacer()
             }
         }
     }.frame(width: 230, height: 150)
 }
 
 */

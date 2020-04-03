//
//  PracticeSetList.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct PracticeSetList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: PracticeSet.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \PracticeSet.name, ascending: true)]
    ) var sets: FetchedResults<PracticeSet>
    
    @Binding var isRootActive: Bool
    @State var isActive = false
    
    /*
    func removeSet(at offsets: IndexSet) {
        for index in offsets {
            let set = sets[index]
            managedObjectContext.delete(set)
        }
        do {
            try managedObjectContext.save()
        } catch {
            // handle the Core Data error
        }
    }
    */
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    
                    VStack {
                        NavigationLink(destination: NewPracticeSet(), isActive: self.$isActive) {
                            EmptyView()
                        }
                        Button(action: {self.isActive = true},
                               label: { VStack {
                                    Text("New Practice Set")
                                    Image(systemName: "plus.circle")
                                }}
                        )
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2)
                            )
                    }.padding()
                    
                    ForEach(sets) { set in NavigationLink(destination: LandingPage(set: set)) {
                            Text(set.name)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2)
                                )
                        }
                    }
                     .padding()
                    
                }.navigationBarItems(trailing: EditButton())
            }
        }.padding()
    }
}

struct PracticeSetList_Previews: PreviewProvider {
    static var previews: some View {
        PracticeSetList(isRootActive: .constant(false))
    }
}

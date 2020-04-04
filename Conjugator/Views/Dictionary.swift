//
//  Dictionary.swift
//  programmaticui
//
//  Created by Ezzat Suhaime on 3/25/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct Dictionary: View {
    var body: some View {
        List {
            ForEach(verbData) { verb in NavigationLink(destination: DictionaryDetail(verb: verb)) {
                Text(verb.name)
                }
            }
        }.navigationBarTitle("Dictionary")
    }
}


struct DictionaryDetail: View {
    var verb: Verb
    let comma: String = ", "
    var body: some View {
        VStack() {
            VStack {
                HStack {
                    Text("Indicative Present").font(.headline)
                    Spacer()
                }.padding(.leading, 5.0)
                HStack() {
                    Text(verb.indPresent.s1! + comma +  verb.indPresent.s2! + comma + verb.indPresent.s3! + comma + verb.indPresent.p1! + comma + verb.indPresent.p2! + comma + verb.indPresent.p3!)
                    Spacer()
                }
                    .padding(.leading, 20.0)
                    .lineLimit(2)
                    .allowsTightening(true)
                
                HStack {
                    Text("Indicative Preterite").font(.headline)
                    Spacer()
                }.padding(.leading, 5.0)
                HStack {
                    Text(verb.indPreterite.s1! + comma +  verb.indPreterite.s2! + comma + verb.indPreterite.s3! + comma + verb.indPreterite.p1! + comma + verb.indPreterite.p2! + comma + verb.indPreterite.p3!)
                    Spacer()
                }
                    .padding(.leading, 20.0)
                    .lineLimit(2)
                    .allowsTightening(true)
                
                HStack {
                    Text("Indicative Imperfect").font(.headline)
                    Spacer()
                }.padding(.leading, 5.0)
                HStack {
                    Text(verb.indImperfect.s1! + comma +  verb.indImperfect.s2! + comma + verb.indImperfect.s3! + comma + verb.indImperfect.p1! + comma + verb.indImperfect.p2! + comma + verb.indImperfect.p3!)
                    Spacer()
                }
                    .padding(.leading, 20.0)
                    .lineLimit(2)
                    .allowsTightening(true)
                
                HStack {
                    Text("Indicative Conditional").font(.headline)
                    Spacer()
                }.padding(.leading, 5.0)
                HStack {
                    Text(verb.indConditional.s1! + comma +  verb.indConditional.s2! + comma + verb.indConditional.s3! + comma + verb.indConditional.p1! + comma + verb.indConditional.p2! + comma + verb.indConditional.p3!)
                    Spacer()
                }
                    .padding(.leading, 20.0)
                    .lineLimit(2)
                    .allowsTightening(true)
                
                HStack {
                    Text("Indicative Future").font(.headline)
                    Spacer()
                }.padding(.leading, 5.0)
                
                HStack {
                    Text(verb.indFuture.s1! + comma +  verb.indFuture.s2! + comma + verb.indFuture.s3! + comma + verb.indFuture.p1! + comma + verb.indFuture.p2! + comma + verb.indFuture.p3!)
                    Spacer()
                }
                    .padding(.leading, 20.0)
                    .lineLimit(2)
                    .allowsTightening(true)
            }
            Spacer()
        }.navigationBarTitle(verb.name)
    }
}

struct Dictionary_Previews: PreviewProvider {
    static var previews: some View {
        Dictionary()
    }
}

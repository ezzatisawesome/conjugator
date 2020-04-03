//
//  Verb.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import Foundation

struct Verb: Identifiable {
    var id = UUID()
    var name: String
    var indPresent: Conjugations = Conjugations()
    var indFuture: Conjugations = Conjugations()
    var indImperfect: Conjugations = Conjugations()
    var indPreterite: Conjugations = Conjugations()
    var indConditional: Conjugations = Conjugations()
    var indPresentPerfect: Conjugations = Conjugations()
    var indFuturePerfect: Conjugations = Conjugations()
    var indPastPerfect: Conjugations = Conjugations()
    var indPreteriteArchaic: Conjugations = Conjugations()
    var indConditionalPerfect: Conjugations = Conjugations()
    var subPresent: Conjugations = Conjugations()
    var subImperfect: Conjugations = Conjugations()
    var subFuture: Conjugations = Conjugations()
    var subPresentPerfect: Conjugations = Conjugations()
    var subFuturePerfect: Conjugations = Conjugations()
    var subPastPerfect: Conjugations = Conjugations()
    var imperativeAffirmative: Conjugations = Conjugations()
    var imperativeNegative: Conjugations = Conjugations()
    
    init(name: String) {
        //self.id = id
        self.name = name
    }
    
    func getConjugated(tense: Tense, form: Form) -> String {
        switch tense {
        case .indicativePresent:
            switch form {
            case .s1:
                return indPresent.s1!
            case .s2:
                return indPresent.s2!
            case .s3:
                return indPresent.s3!
            case .p1:
                return indPresent.p1!
            case .p2:
                return indPresent.p2!
            case .p3:
                return indPresent.p3!
        
            }
        case .indicativeFuture:
            switch form {
                case .s1:
                    return indFuture.s1!
                case .s2:
                    return indFuture.s2!
                case .s3:
                    return indFuture.s3!
                case .p1:
                    return indFuture.p1!
                case .p2:
                    return indFuture.p2!
                case .p3:
                    return indFuture.p3!
            
                }
        case .indicativeImperfect:
            switch form {
                case .s1:
                    return indImperfect.s1!
                case .s2:
                    return indImperfect.s2!
                case .s3:
                    return indImperfect.s3!
                case .p1:
                    return indImperfect.p1!
                case .p2:
                    return indImperfect.p2!
                case .p3:
                    return indImperfect.p3!
            
                }
        case .indicativePreterite:
            switch form {
                case .s1:
                    return indPreterite.s1!
                case .s2:
                    return indPreterite.s2!
                case .s3:
                    return indPreterite.s3!
                case .p1:
                    return indPreterite.p1!
                case .p2:
                    return indPreterite.p2!
                case .p3:
                    return indPreterite.p3!
            
                }
        case .indicativeConditional:
            switch form {
                case .s1:
                    return indConditional.s1!
                case .s2:
                    return indConditional.s2!
                case .s3:
                    return indConditional.s3!
                case .p1:
                    return indConditional.p1!
                case .p2:
                    return indConditional.p2!
                case .p3:
                    return indConditional.p3!
            
                }
        case .indicativePresentPerfect:
            switch form {
                case .s1:
                    return indPresentPerfect.s1!
                case .s2:
                    return indPresentPerfect.s2!
                case .s3:
                    return indPresentPerfect.s3!
                case .p1:
                    return indPresentPerfect.p1!
                case .p2:
                    return indPresentPerfect.p2!
                case .p3:
                    return indPresentPerfect.p3!
            
                }
        case .indicativeFuturePerfect:
            switch form {
                case .s1:
                    return indFuturePerfect.s1!
                case .s2:
                    return indFuturePerfect.s2!
                case .s3:
                    return indFuturePerfect.s3!
                case .p1:
                    return indFuturePerfect.p1!
                case .p2:
                    return indFuturePerfect.p2!
                case .p3:
                    return indFuturePerfect.p3!
            
                }
        case .indicativePastPerfect:
            switch form {
                case .s1:
                    return indPastPerfect.s1!
                case .s2:
                    return indPastPerfect.s2!
                case .s3:
                    return indPastPerfect.s3!
                case .p1:
                    return indPastPerfect.p1!
                case .p2:
                    return indPastPerfect.p2!
                case .p3:
                    return indPastPerfect.p3!
            
                }
        case .indicativePreteriteArchaic:
            switch form {
                case .s1:
                    return indPreteriteArchaic.s1!
                case .s2:
                    return indPreteriteArchaic.s2!
                case .s3:
                    return indPreteriteArchaic.s3!
                case .p1:
                    return indPreteriteArchaic.p1!
                case .p2:
                    return indPreteriteArchaic.p2!
                case .p3:
                    return indPreteriteArchaic.p3!
            
                }
        case .indicativeConditionalPerfect:
            switch form {
                case .s1:
                    return indConditionalPerfect.s1!
                case .s2:
                    return indConditionalPerfect.s2!
                case .s3:
                    return indConditionalPerfect.s3!
                case .p1:
                    return indConditionalPerfect.p1!
                case .p2:
                    return indConditionalPerfect.p2!
                case .p3:
                    return indConditionalPerfect.p3!
            
                }
        case .subjunctivePresent:
            switch form {
                case .s1:
                    return subPresent.s1!
                case .s2:
                    return subPresent.s2!
                case .s3:
                    return subPresent.s3!
                case .p1:
                    return subPresent.p1!
                case .p2:
                    return subPresent.p2!
                case .p3:
                    return subPresent.p3!
            
                }
        case .subjunctiveImperfect:
            switch form {
                case .s1:
                    return subImperfect.s1!
                case .s2:
                    return subImperfect.s2!
                case .s3:
                    return subImperfect.s3!
                case .p1:
                    return subImperfect.p1!
                case .p2:
                    return subImperfect.p2!
                case .p3:
                    return subImperfect.p3!
            
                }
        case .subjunctiveFuture:
            switch form {
                case .s1:
                    return subFuture.s1!
                case .s2:
                    return subFuture.s2!
                case .s3:
                    return subFuture.s3!
                case .p1:
                    return subFuture.p1!
                case .p2:
                    return subFuture.p2!
                case .p3:
                    return subFuture.p3!
            
                }
        case .subjunctivePresentPerfect:
            switch form {
                case .s1:
                    return subPresentPerfect.s1!
                case .s2:
                    return subPresentPerfect.s2!
                case .s3:
                    return subPresentPerfect.s3!
                case .p1:
                    return subPresentPerfect.p1!
                case .p2:
                    return subPresentPerfect.p2!
                case .p3:
                    return subPresentPerfect.p3!
            
                }
        case .subjunctiveFuturePerfect:
            switch form {
                case .s1:
                    return subFuturePerfect.s1!
                case .s2:
                    return subFuturePerfect.s2!
                case .s3:
                    return subFuturePerfect.s3!
                case .p1:
                    return subFuturePerfect.p1!
                case .p2:
                    return subFuturePerfect.p2!
                case .p3:
                    return subFuturePerfect.p3!
            
                }
        case .subjunctivePastPerfect:
            switch form {
                case .s1:
                    return subPastPerfect.s1!
                case .s2:
                    return subPastPerfect.s2!
                case .s3:
                    return subPastPerfect.s3!
                case .p1:
                    return subPastPerfect.p1!
                case .p2:
                    return subPastPerfect.p2!
                case .p3:
                    return subPastPerfect.p3!
            
                }
        case .imperativeAffirmative:
            switch form {
                case .s1:
                    return imperativeAffirmative.s1!
                case .s2:
                    return imperativeAffirmative.s2!
                case .s3:
                    return imperativeAffirmative.s3!
                case .p1:
                    return imperativeAffirmative.p1!
                case .p2:
                    return imperativeAffirmative.p2!
                case .p3:
                    return imperativeAffirmative.p3!
            
                }
        case .imperativeNegative:
            switch form {
                case .s1:
                    return imperativeNegative.s1!
                case .s2:
                    return imperativeNegative.s2!
                case .s3:
                    return imperativeNegative.s3!
                case .p1:
                    return imperativeNegative.p1!
                case .p2:
                    return imperativeNegative.p2!
                case .p3:
                    return imperativeNegative.p3!
            
                }
        }
    }
}

//
//  ConjugationTenseForm.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import Foundation

struct Conjugations {
    var tense: Tense?
    var s1: String?
    var s2: String?
    var s3: String?
    var p1: String?
    var p2: String?
    var p3: String?
}

enum Tense: String {
    case indicativePresent = "Indicative Presente"
    case indicativeFuture = "Indicative Futuro"
    case indicativeImperfect = "Indicative Imperfect"
    case indicativePreterite = "Indicative Preterite"
    case indicativeConditional = "Indicative Conditional"
    case indicativePresentPerfect = "Indicative Present Perfect"
    case indicativeFuturePerfect = "Indicative Future Perfect"
    case indicativePastPerfect = "Indicative Past Perfect"
    case indicativePreteriteArchaic = "Indicative Preterite Archaic"
    case indicativeConditionalPerfect = "Indicative Conditional Perfect"
    
    case subjunctivePresent = "Subjunctive Present"
    case subjunctiveImperfect = "Subjunctive Imperfect"
    case subjunctiveFuture = "Subjunctive Future"
    case subjunctivePresentPerfect = "Subjunctive Present Perfect"
    case subjunctiveFuturePerfect = "Subjunctive Future Perfect"
    case subjunctivePastPerfect = "Subjunctive Past Perfect"
    
    case imperativeAffirmative = "Imperative Affirmative"
    case imperativeNegative = "Imperative Negative"
}

enum Form: String {
    case s1 = "yo"
    case s2 = "tú"
    case s3 = "el/ella/usted"
    case p1 = "nos"
    case p2 = "vos/ustedes"
    case p3 = "ellos/ellas/ustedes"
}

//
//  Background.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//

import SwiftUI

struct Neumorphic: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("LightShadow"), radius: 4, x: -4, y: -4)
            .shadow(color: Color("DarkShadow"), radius: 4, x: 4, y: 4)
    }
}

struct flashcard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("DarkShadow"), radius: 4, x: -4, y: -4)
            .shadow(color: Color("DarkShadow"), radius: 4, x: 4, y: 4)
    }
}

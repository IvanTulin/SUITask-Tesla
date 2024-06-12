//
//  NeumorphismSelected.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"),radius: 5, x: -5, y: 5)
            .shadow(color: Color("darkShadow"),radius: 5, x: -5, y: -5)
    }
}

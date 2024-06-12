//
//  NeumorphismUnSelectedCircule.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

struct NeumorphismUnSelectedCircule: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color("background")))
            .neumorphismUnSelected()
    }
}

struct NeumorphismSelectedBackCircule: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Circle().fill(Color.background))
            .shadow(color: .gray.opacity(0.10),radius: 5, x: -5, y: -5)
            .shadow(color: .black.opacity(0.75),radius: 15, x: 6, y: 6)
    }
}

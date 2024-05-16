//
//  View + Extension.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

extension View {
    func neumorphismUnSelected() -> some View {
        modifier(NeumorphismUnSelected())
    }
    
    func neumorphismSelected() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismSelectedCirculeStyle() -> some View {
        modifier(NeumorphismUnSelectedCircule())
    }
    
    func neumorphismSelectedSettings() -> some View {
        modifier(NeumorphismSelectedSettings())
    }
    
    func neumorphismSelectedBackCircule() -> some View {
        modifier(NeumorphismSelectedBackCircule())
    }
}

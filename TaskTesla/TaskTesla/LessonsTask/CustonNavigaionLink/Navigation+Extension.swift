//
//  Navigation+Extension.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI

struct NavigationModifier<Destination>: ViewModifier where Destination: View {
    let destination: Destination
    let isActive: Binding<Bool>
    
    init(destination: Destination, isActive: Binding<Bool>) {
        self.destination = destination
        self.isActive = isActive
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destination, isActive: isActive) {
                        EmptyView()
                    }
                .hidden()
            )
    }
}

struct NavigationModelModifier<Destination: View, Model: Any>: ViewModifier {
    let model: Model?
    let isActive: Binding<Bool>
    let destinationHandler: ((Model) -> (Destination))?
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destinationView, isActive: isActive) {
                        EmptyView()
                    }
                .hidden()
            )
    }
    
    private var destinationView: some View {
        Group {
            if let model = model, let view = destinationHandler?(model) {
                view
            } else {
               EmptyView()
            }
        }
    }
    
    init(model: Model?, isActive: Binding<Bool>, destinationHandler: (@escaping (Model) -> Destination)) {
        self.model = model
        self.isActive = isActive
        self.destinationHandler = destinationHandler
    }
}

extension View {
    func navigation<Destination: View>(destination: Destination, isActive: Binding<Bool>) -> some View {
        modifier(NavigationModifier(destination: destination, isActive: isActive))
    }
    
    func navigation<Destination: View, Model: Any>(model: Model, isActive: Binding<Bool>, destinationHandler: @escaping (Model) -> Destination) -> some View {
        modifier(NavigationModelModifier(model: model, isActive: isActive, destinationHandler: destinationHandler ))
    }
}

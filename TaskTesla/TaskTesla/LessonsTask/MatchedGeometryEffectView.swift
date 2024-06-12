//
//  MatchedGeometryEffectView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack(spacing: 150) {
            ForEach(menu, id: \.self) { item in
                ZStack(alignment: .bottom) {
                    if selected == item {
                        menuItem
                    }
                    Text(item)
                        .foregroundStyle(selected == item ? .black : .black.opacity(0.6))
                        .frame(height: 70)
                        .scaleEffect(selected == item ? 1.5 : 0.8)
                        .offset(y: -20)
                }
                .frame(width: 75)
                .onTapGesture {
                    withAnimation(.linear) {
                        selected = item
                        selectedFood = item
                    }
                }
            }
            .rotationEffect(.degrees(270))
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.bottomGradient)
                .frame(width: 50, height: UIScreen.main.bounds.height + 10)
        .offset(x: -10)
        )
    }
    
    @Namespace private var menuSpaceOne
    @Namespace private var menuSpaceTwo
    @Binding var selectedFood: String
    @State private var selected = "Food"
    
    private let menu = ["Drinks", "Food", "Bakary"]
    
    private var menuItem: some View {
        VStack {
            Circle()
                .fill(.bottomGradient)
                .matchedGeometryEffect(id: "menuSpaceOne", in: menuSpaceOne)
                .frame(width: 80, height: 80)
                .offset(y: 10)
            
            Circle()
                .fill(.orange)
                .matchedGeometryEffect(id: "menuSpaceTwo", in: menuSpaceTwo)
                .frame(width: 6, height: 6)
                .offset(y: -15)
        }
        .offset(y: -10)
    }
}

struct MatchedGeometryEffectView: View {
    @State var selected = "Food"
    
    var body: some View {
        HStack {
            
            MenuView(selectedFood: $selected)
            Spacer()
            if selected == "Food" {
                plateView
                    .zIndex(1)
                    .transition(.asymmetric(insertion: .offset(y: -500), removal: .offset(y: 500)))
            }
            
            Spacer()
        }
        
    }
    
    private var plateView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.bottomGradient)
            .frame(width: 200, height: 300)
            .overlay {
                Text("Лосось на гриле")
                    .bold()
                    .foregroundStyle(.orange)
            }
            .overlay {
                Circle()
                    .fill(.gray.opacity(0.3))
            }
    }
}

#Preview {
    MatchedGeometryEffectView()
}

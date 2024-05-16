//
//  ButtomSheetView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

struct ButtomSheetView: View {
    var body: some View {
        ZStack {
            Color(.systemGray4)
            VStack {
                Capsule()
                    .fill(.white)
                    .frame(width: 80, height: 3)
                    .padding(.top)
                
                ForEach(0..<4) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.pink))
                        .frame(height: 100)
                        .padding(.horizontal)
                }
                Spacer()
            }
            .frame(height: UIScreen.main.bounds.height + 100)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.darkGray)))
            .ignoresSafeArea(.all, edges: .bottom)
            .offset(y: UIScreen.main.bounds.height)
            .offset(y: currentMenuOffsetY)
            .gesture(draGesture)
        }
        .ignoresSafeArea(edges: .top)
    }
    
    @GestureState private var gesture = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    
    private var draGesture: some Gesture {
        DragGesture()
            .updating($gesture) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height - 100
                withAnimation {
                    //currentMenuOffsetY = 0
                    
                    if -currentMenuOffsetY > maxHeight / 4 {
                        currentMenuOffsetY = -maxHeight / 3
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    
    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            currentMenuOffsetY = gesture.height + lastMenuOffsetY
        }
    }
}

#Preview {
    ButtomSheetView()
}

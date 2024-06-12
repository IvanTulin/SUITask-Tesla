//
//  TeslaTabView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI


struct TeslaTabView<Content: View>: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            ZStack {
                if isTabbarVisible {
                    VStack {
                        Image(.plusIcon)
                            .offset(y: 35)
                        
                        ZStack {
                            ContolTabView()
                                .fill(.darkShadow)
                                .stroke( LinearGradient(colors: [.gray.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                                .frame(width: 400)
                                .frame(height: 90)
                                .shadow(color: .gray.opacity(0.15),radius: 5.5, x: -5, y: -5)
                            .shadow(color: .black.opacity(0.95),radius: 20, x: 6, y: 6)
                            HStack {
                                Spacer()
                                tabsView
                                Spacer()
                            }
                        }
                        
                    }
                    
                }
            }
        }
        .onPreferenceChange(TabItemPreferenceKey.self, perform: { value in
            tabs = value
        })
    }
    
    @Binding var selection: Int
    @Binding var isTabbarVisible: Bool
    
    @Namespace private var tabBarItem
    @State private var tabs: [TabItem] = []
    @State private var isShowCharging = false
    
    private var content: Content
    private var tabsView: some View {
        HStack(spacing: 40) {
            ForEach(Array(tabs.enumerated()),id: \.offset) { index, element in
                
                if index == 1 {
                    HStack() {
                        Image(element.icon)
                            .padding(.trailing, 55)
                            .background(
                                ZStack {
                                    if selection == index {
                                        Circle()
                                            .fill(.topGradient.opacity(0.5))
                                            .blur(radius: 10)
                                            .frame(width: 70, height: 50)
                                            .matchedGeometryEffect(id: "tabitems", in: tabBarItem)
                                            .padding(.trailing, 55)
                                    }
                                }
                            )
                    }
                    .foregroundColor(selection == index ? .black : .gray)
                    .onTapGesture {
                        withAnimation {
                            selection = index
                            isShowCharging.toggle()
                        }
                    }
                } else {
                    HStack {
                        Image(element.icon)
                            .background(
                                ZStack {
                                    if selection == index {
                                        Circle()
                                            .fill(.topGradient.opacity(0.5))
                                            .blur(radius: 10)
                                            .frame(width: 70, height: 50)
                                            .matchedGeometryEffect(id: "tabitems", in: tabBarItem)
                                    }
                                }
                            )
                    }
                    .foregroundColor(selection == index ? .black : .gray)
                    .onTapGesture {
                        withAnimation {
                            selection = index
                        }
                    }
                }
            }
        }
    }
    
    init(selection: Binding<Int>, isTabbarVisible: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
        _isTabbarVisible = isTabbarVisible
    }
}


struct TeslaContentView: View {
    @State var selection = 0
    @State var isTabbarVisible = true
    
    var body: some View {

        TeslaTabView(selection: $selection, isTabbarVisible: $isTabbarVisible) {
            Color.gray
                .myTabItem {
                    TabItem(text: "", icon: "teslaIc")
                }
                .opacity(selection == 0 ? 1 : 0)
            Color.green
                .myTabItem {
                    TabItem(text: "", icon: "Stats")
                }
                .opacity(selection == 1 ? 1 : 0)
                .onAppear {
                    
                        //isTabbarVisible = false
                   
                }
                .onDisappear() {
                    isTabbarVisible = true
                }
            
            Color.blue
                .myTabItem {
                    TabItem(text: "", icon: "Explore")
                }
                .opacity(selection == 2 ? 1 : 0)
            Color.red
                .myTabItem {
                    TabItem(text: "", icon: "profileMore")
                }
                .opacity(selection == 3 ? 1 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TeslaContentView()
}

//
//  ContentView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 13.05.2024.
//

import SwiftUI

struct SettingsScreenView: View {
    var body: some View {
        NavigationView {
            TeslaTabView(selection: $selection, isTabbarVisible: $isTabbarVisible) {
                createBackgroundStackView {
                    VStack {
                        HStack {
                            headerView
                            Spacer().frame(width: 177)
                            profileView
                        }
                        
                        carView
                        controlPanelView
                        Spacer()
                            .frame(height: 260)
                            .edgesIgnoringSafeArea(.bottom)
                    }
                    .offset(y: -70)
                    .padding(.top, 140)
                    .navigationBarBackButtonHidden(true)
                    .onAppear {
                        isTabbarVisible = true
                    }
                }
                .myTabItem {
                    TabItem(text: "", icon: "teslaIc")
                }
                .opacity(selection == 0 ? 1 : 0)
                
                // Экран зарядки
               ChargingView()
                    .myTabItem {
                        TabItem(text: "", icon: "Stats")
                    }
                    .opacity(selection == 1 ? 1 : 0)
                
                // Экран геолакации
                Color.blue
                    .myTabItem {
                        TabItem(text: "", icon: "Explore")
                    }
                    .opacity(selection == 2 ? 1 : 0)
                
                // Экран профиля
                Color.red
                    .myTabItem {
                        TabItem(text: "", icon: "profileMore")
                    }
                    .opacity(selection == 3 ? 1 : 0)
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @State var isTabbarVisible = true
    @State var selection = 0
    @State var isShowClimateSystemScreen = false
    @State var isCarClose = false
    @State var tagSelected = 0
    
    private var gradient: LinearGradient {
        LinearGradient(colors:  [Color("topGradient"), Color("bottomGradient")], startPoint: .bottom, endPoint: .top )
    }
    
    private var darkGradient: LinearGradient {
        LinearGradient(colors:  [Color.darkShadow.opacity(0.7), Color.gray.opacity(0.30)], startPoint: .topLeading, endPoint: .bottomLeading )
    }

    private var darkGradientForBackground: LinearGradient {
        LinearGradient(colors: [.black,.background, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    private var gradientForButton: LinearGradient {
        LinearGradient(colors: [.gray,.background, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    private var profileView: some View {
        HStack {

            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 40).fill(gradientForButton.opacity(0.55))
                        .frame(width: 44, height: 44)
                    Image(.profileUser)
                        .accentColor(.gray)
                }
            }
            .background(RoundedRectangle(cornerRadius: 40).fill(Color.background))
            .overlay {
                Circle()
                    .stroke( darkGradientForBackground.opacity(0.55), lineWidth: 2)
            }
            .neumorphismSelectedBackCircule()
        }
        .padding(.top, -12)
    }
    
    private var controlPanelView: some View {
        HStack(spacing: 10) {
            ForEach(1..<5) { index in
                NavigationLink(destination: ClimateSystemsView(), isActive: $isShowClimateSystemScreen) {
                    EmptyView()
                }
                .hidden()
                .buttonStyle(PlainButtonStyle())
                
                Button {
                    withAnimation {
                        tagSelected = index
                    }
                    if index == 2 {
                        isShowClimateSystemScreen.toggle()
                        isTabbarVisible.toggle()
                        print(index)
                    }
                    
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .frame(width: 50, height: 50)
                .overlay {
                    Circle()
                        .stroke( gradient, lineWidth: 2)
                        .opacity(tagSelected == index ? 1 : 0)
                }
                .cornerRadius(25)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 85).fill(Color.background))
        .shadow(color: .gray.opacity(0.15),radius: 5, x: -5, y: -5)
        .shadow(color: .black.opacity(0.75),radius: 15, x: 6, y: 6)
    }
    
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Image(.battery)
            }
            .frame(width: 105)
        }
        .padding(.leading, 5)
    }
    
    private var carView: some View {
        Image(.settingsCar)
            .resizable()
            .frame(width: 390,height: 254)
            .padding(.horizontal)
            .padding(.bottom)
            .shadow(color: .white.opacity(0.2 ),radius: 25, x: 10, y: 10)
    }
    
    private func createBackgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color("background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}

#Preview {
    SettingsScreenView()
        .environment(\.colorScheme,  .dark)
}

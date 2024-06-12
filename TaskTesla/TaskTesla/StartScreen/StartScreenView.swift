//
//  StartScreenView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        NavigationView {
            if !isShowLogo {
                ZStack {
                    TeslaLogo()
                        .fill(.white.opacity(0.1))
                        .frame(width: 300, height: 300)
                    TeslaLogo()
                        .trim(from: 0, to: isAnimating ? 1 : 0)
                        .stroke(gradient.opacity(0.5), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                    .frame(width: 300, height: 300)
                }
            } else {
                createBackgroundStackView {
                    VStack(spacing: 42) {
                        NavigationLink(destination: SettingsScreenView(), isActive: $isShowingSettingsView) {
                            VStack {
                                settingsView
                            }
                        }
                        headerView
                            .offset(x: isShowWelcone ? 0 : -500)
                            .animation(.linear, value: isShowWelcone)
                        carView
                        closeCarControllView
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.9) {
                isShowLogo = true
            }
            isShowLogo = false
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    @State var isShowLogo = false
    @State var isShowWelcone = false
    @State var isShowingSettingsView = false
    @State var isCarClose = false
    @State var isShowSettings = false
    @State var tagSelected = 0
    @State private var isAnimating = false
    
    private var gradient: LinearGradient {
        LinearGradient(colors:  [Color("topGradient"), Color("bottomGradient")], startPoint: .bottom, endPoint: .top )
    }
    
    private var darkGradient: LinearGradient {
        LinearGradient(colors: [.topDarkGradient, .middleDarkGradient, .bottomDarkGradient], startPoint: .top, endPoint: .bottom)
    }
    
    private var gradientForButton: LinearGradient {
        LinearGradient(colors: [.gray,.background, .black], startPoint: .topLeading, endPoint: .bottomTrailing)    }
    
    private var darkGradientForBackground: LinearGradient {
        LinearGradient(colors: [.black,.background, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    

    private var settingsView: some View {
        HStack {
            Spacer().frame(width: 298)
            
            Button {
                isShowingSettingsView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 40).fill(gradientForButton.opacity(0.55))
                        .frame(width: 44, height: 44)
                    Image(.settingsIcon)

                }
            }
            .background(RoundedRectangle(cornerRadius: 40).fill(Color.background))
            .overlay {
                Circle()
                    .stroke( darkGradientForBackground.opacity(0.55), lineWidth: 2)
            }
            .neumorphismSelectedBackCircule()
        }
        .padding(.top, -30)
    }
    
    private var closeCarControllView: some View {
        Button {
            withAnimation(.linear(duration: 1.5)) {
                isCarClose.toggle()
            }
            if isCarClose {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isShowWelcone = true
                }
            } else {
                isShowWelcone = false
            }
            
        } label: {
            Text(isCarClose ? "Unlock" : "Lock")
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 82, height: 22)

            //Spacer().frame(height: 20)
            Image(systemName: isCarClose ? "lock.open.fill" : "lock.fill")
                .tint(gradient)
                .neumorphismSelectedCirculeStyle()
                .overlay {
                    Circle()
                        .stroke( .white.opacity(0.3), lineWidth: 2)
                }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(Color("background")))
        .neumorphismUnSelected()
        .frame(width: 165, height: 79 )
    }
    
    private var headerView: some View {
        HStack {
            if isCarClose {
                VStack(alignment: .center) {
                    Text("Hi")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                        .opacity(0.4)
                        .fontWeight(.semibold)
                    
                    Text("Welcome back")
                        .fontWeight(.bold)
                        .font(.system(size: 38))
                }
            } else {
                VStack(alignment: .center) {
                    Text("")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                        .opacity(0.4)
                    
                        .fontWeight(.semibold)
                    
                    Text("")
                        .fontWeight(.bold)
                        .font(.system(size: 38))
                    
                }
            }
        }
        .frame(width: 270, height: 100)
    }
    
    private var carView: some View {
        Image(isCarClose ? "whiteCar" : "tesla")
            .resizable()
            .frame(width: 307,height: 230)
            .padding(.horizontal)
            .padding(.bottom, 90)
            .shadow(color: isCarClose ? .topGradient.opacity(0.3 ) : .black.opacity(0.9 ) ,radius: 110, x: 10, y: 10)
    }
    
    private func createBackgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            
            if isCarClose {
                Rectangle()
                    .fill(Color("background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                content()
            } else {
                Rectangle()
                    .fill(darkGradient)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                content()
            }
            
        }
    }
}


#Preview {
    StartScreenView()
        .environment(\.colorScheme, .dark)
}

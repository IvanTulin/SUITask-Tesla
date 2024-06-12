//
//  ClimateSystemsView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

struct ClimateSystemsView: View {
    var body: some View {
        createBackgroundStackView {
            ZStack {
                VStack {
                    headerView
                    Spacer().frame(height: 85)
                    numberOfDegreesView
                    Spacer().frame(height: 65)
                    climateControlView
                    climateControlSheet
                    
                }
                if isShowSupportAlert {
                    supportAlertView
                        .offset(y: -200)
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .scale))
                        .animation(.easeInOut)
                }
            }
            .padding(.top, 300)
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var climateSystemsModelView = ClimateSystemsViewModel()
    
    @State var isStepperOn = false
    @State var isExpanded = true
    @State var isActivateAC = false
    @State var isShowSupportAlert = false
    @State var degree: Double = 15
    @State var acDegree = 15
    
    @State private var selectedColor: Color = .blue
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    @GestureState private var gesture = CGSize.zero
    
    @State private var chengedValue = 0
    @State private var circleProgree: Double = 0
    @State private var offset: Double = 0
    
    private var gradient: LinearGradient {
        LinearGradient(colors:  [Color.darkShadow.opacity(0.7), Color.gray.opacity(0.30)], startPoint: .topLeading, endPoint: .bottomLeading )
    }
    
    private var gradientSlider: LinearGradient {
        LinearGradient(colors: [Color(.blue) , Color("topGradient").opacity(0.8), Color("bottomGradient").opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing )
    }
    
    private var gradientForButton: LinearGradient {
        LinearGradient(colors: [.gray,.background, .black], startPoint: .topLeading, endPoint: .bottomTrailing)    }
    
    private var darkGradientForBackground: LinearGradient {
        LinearGradient(colors: [.black,.background, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    
    
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gesture) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height - 100
                withAnimation {
                    
                    if -currentMenuOffsetY > maxHeight / 5 {
                        currentMenuOffsetY = -maxHeight / 3.5
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    
    private var supportAlertView: some View {
        ZStack {
            if #available(iOS 17.0, *) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.darkShadow.opacity(0.7))
                    .stroke(.blue, lineWidth: 1)
                    .frame(width: 310, height: 150)
            }
            VStack(alignment: .center){
                Text("Tesla Support")
                    .font(.title2)
                    .foregroundStyle(.white)
                Spacer().frame(height: 18)
                Text("https://www.tesla.com/support")
                Spacer().frame(height: 50)
                HStack {
                    Button("Ok"){
                        withAnimation(.linear) {
                            isShowSupportAlert = false
                        }
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
    
    private var circleAnimationView: some View {
        Circle()
            .trim(from: 0, to: CGFloat(degree - 15) / 15)
            .stroke(LinearGradient(gradient: Gradient(colors: [selectedColor]), startPoint: .leading, endPoint: .trailing), style:  StrokeStyle(lineWidth: 20, lineCap: .round))
            .frame(height: 145)
            .rotationEffect(.degrees(-90))
            .shadow(color: selectedColor, radius: 10)
            .animation(.easeInOut(duration: 1.0))
    }
    
    private var numberOfDegreesView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 85)
                .fill(LinearGradient(colors: [.black.opacity(0.5),.background, .gray.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 170, height: 170)
                .background(RoundedRectangle(cornerRadius: 85).fill(Color.background))
                .neumorphismSelectedBackCircule()
                
            RoundedRectangle(cornerRadius: 60)
                .fill( LinearGradient(colors: [.gray.opacity(0.5),.background, .black.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 120, height: 120)
                .background(Circle().fill(Color.background))
                .overlay {
                    Circle()
                        .stroke( darkGradientForBackground, lineWidth: 2)
                }
                .shadow(color: .gray.opacity(0.15),radius: 25, x: -5, y: -5)
                .shadow(color: .black.opacity(0.75),radius: 15, x: 6, y: 6)
                .blur(radius: 1)
            
            circleAnimationView
            
            Text(isActivateAC ? "\(degree.formatted(.number)) °C" : "")
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
    private var climateControlView: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            ForEach(climateSystemsModelView.images.indices, id: \.self) { index in
                if index == 0 {
                    createClimateSettings(name: climateSystemsModelView.nameSettings[index], image: climateSystemsModelView.images[index], value: $acDegree, offset: climateSystemsModelView.offset[index])
                } else if index != 0 {
                    createClimateSettings(name: climateSystemsModelView.nameSettings[index], image: climateSystemsModelView.images[index], value: $climateSystemsModelView.degrees[index],
                                          offset: climateSystemsModelView.offset[index])
                }
            }
        } label: {
            Text("Climate control")
                .foregroundStyle(Color.gray)
                .font(.system(size: 22))
        }
        .tint(.black)
        .padding()
    }
    
    private var headerView: some View {
        HStack {
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 40).fill(gradientForButton.opacity(0.55))
                        .frame(width: 44, height: 44)
                    Image(.backButton)
                        .accentColor(.gray)
                }
            }
            .background(RoundedRectangle(cornerRadius: 40).fill(Color.background))
            .overlay {
                Circle()
                    .stroke( darkGradientForBackground.opacity(0.55), lineWidth: 2)
            }
            .neumorphismSelectedBackCircule()
            
            Spacer().frame(width: 68)
            Text("CLIMATE")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            Spacer().frame(width: 68)
            
            Button {
                isShowSupportAlert = true
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
    }
    
    private var climateStepper: some View {
        HStack {
            Button(action: {
                isStepperOn = true
                if acDegree > 15 {
                    acDegree -= 1
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .tint(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(width: 20, height: 28)
            
            Spacer().frame(width: 10)
            Text("\(degree.formatted(.number))°")
                .font(.system(size: 38))
                .frame(width: 70, height: 40)
            Spacer().frame(width: 10)
            
            Button(action: {
                isStepperOn = true
                if acDegree <= 30 {
                    acDegree += 1
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .tint(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(width: 20, height: 28)
        }
    }
    
    private var climateControlSheet: some View {
        GeometryReader { proxy  in
            
            return ZStack {
                BlurView(style: .systemUltraThinMaterialDark)
                    .clipShape(Corner(corners: [.topLeft, .topRight], radius: 30))
                VStack {
                    Capsule()
                        .fill(.black)
                        .frame(width: 80, height: 3)
                        .padding(.top)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("A/C is ON")
                                .font(.system(size: 21))
                                .fontWeight(.semibold)
                            Spacer().frame(height: 5)
                            Text("Tap to turn off or swipe up\nfor a fast setup")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer().frame(width: 90)
                        
                        Button {
                            isActivateAC.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40).fill(gradientSlider)
                                    .frame(width: 44, height: 44)
                                Image(systemName: "power")
                                    .accentColor(.white)
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: 40).fill(Color.blue))
                        .overlay {
                            Circle()
                                .stroke(  LinearGradient(colors:  [Color("topGradient"), Color(.white).opacity(0.75)], startPoint: .bottom, endPoint: .top ).opacity(0.55), lineWidth: 2)
                        }
                        .shadow(color: Color("darkShadow").opacity(0.4),radius: 3, x: 0, y: 0)
                        .shadow(color: Color("darkShadow").opacity(0.4),radius: 3, x: 0, y: 0)
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            ColorPicker("", selection: $selectedColor)
                                .frame(width: 30)
                            Spacer().frame(height: 15)
                            Text("Color\nselection")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                        }
                        .padding(.top, 45)
                        
                        Spacer().frame(width: 35)
                        
                        climateStepper
                        
                        Spacer().frame(width: 55)
                        
                        VStack(alignment: .center) {
                            Image(.ventIcon)
                            Spacer().frame(height: 35)
                            Text("Vent")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                        }
                        .padding(.top, 45)
                    }
                    .padding(.top, -25)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .frame(height: 300)
        .ignoresSafeArea(.all, edges: .bottom)
        .offset(y: -22)
        .offset(y: currentMenuOffsetY)
        .gesture(dragGesture)
    }
    
    private func createClimateSettings(name: String, image: String, value: Binding<Int>, offset: Double) -> some View {
        HStack {
            Text(name)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 55)
            
            Spacer().frame(width: 15)
            
            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 40).fill(gradientForButton.opacity(0.55))
                        .frame(width: 50, height: 50)
                    if image == "ListBullet" && isActivateAC {
                        Image("acBlue")
                    } else {
                        Image(image)
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 40).fill(Color.background))
            .overlay {
                Circle()
                    .stroke( darkGradientForBackground.opacity(0.55), lineWidth: 2)
            }
            .neumorphismSelectedBackCircule()
            
            Spacer().frame(width: 1)
            
                

            TeslaSlider(value: value, range: 15...30, step: 1.2, activeTrackColor: selectedColor, inactiveTrackColor: .gray, thumbImage: Image(.sliderLine), trackHeight: 10)
                .frame(height: 20)
                .padding()
                .padding()
                    .tint(selectedColor)
                    .frame(width: 195)
                    .onChange(of: value.wrappedValue, perform: { newValue in
                        degree = Double(newValue)
                    })
        }
        .frame(width: 360, height: 65)
    }
    
    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            currentMenuOffsetY = gesture.height + lastMenuOffsetY
        }
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
    ClimateSystemsView()
        .environment(\.colorScheme,  .dark)
}

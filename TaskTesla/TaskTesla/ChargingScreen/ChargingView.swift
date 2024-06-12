//
//  ChargingView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI

struct ChargingView: View {
    var body: some View {
        createBackgroundStackView {
            ScrollView {
                VStack {
                    headerView
                        .padding(.top, 15)
                    ZStack {
                        carImage
                        
                        batteryСhargeAsPercentage
                            .offset(y: 90)
                    }
                    
                    Spacer().frame(height: 19)
                    chargingBatteryView
                    Spacer().frame(height: 79)
                    //batterySlider
                    Spacer().frame(height: 30)
                    
                    VStack(alignment: .center) {
                        nearbySuperchargersView
                    }
                    .frame(width: UIScreen.main.bounds.width - 60 ,height: 300)
                }
                .offset(y: 29)
            }
        }
    }
    
    @Environment(\.presentationMode) private var presentation
    
    @State var selectionSlider = 0
    @State var valueDegrees: Double = 0
    @State var valueOffset: Double = 0
    @State var chargeLevel: CGFloat = 0.0
    @State var isShomNearby = false
    @State var value = 0
    @State var offset = 0.0
    @State var colorTop = Color.green
    @State var colorBottom = Color.blue
    
    @State private var selectedColor: Color = .white
    
    private var gradient: LinearGradient {
        LinearGradient(colors:  [Color("topGradient"), Color("bottomGradient")], startPoint: .bottom, endPoint: .top )
    }
    
    private var gradientForButton: LinearGradient {
        LinearGradient(colors: [.gray,.background, .black], startPoint: .topLeading, endPoint: .bottomTrailing)    }
    
    private var darkGradientForBackground: LinearGradient {
        LinearGradient(colors: [.black,.background, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    private var darkGradientForSupercharges: LinearGradient {
        LinearGradient(colors: [.black,.black.opacity(0.4), .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
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
            Text("CHARGING")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            Spacer().frame(width: 68)
            
            Button {
//                isShowSupportAlert = true
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
    
    private var carImage: some View {
        Image(.imageCar40)
            .resizable()
            .frame(width: 382, height: 222)
    }
    
    private var chargingBatteryView: some View {
        VStack {
            ZStack {
                ChargingSlider(value: $value, offset: $offset, colorTop: $colorTop, colorBottom: $colorBottom, imageCircle: "slICahrging")
                    .frame(width: 273)
            }
            HStack {
                Spacer().frame(width: 250)
                Image(.seventyFive)
                Spacer().frame(width: 28)
                Image(.hundred)
                Spacer()
            }
            .offset(x: -5, y: 30)
        }
    }
    
    
    private var batteryСhargeAsPercentage: some View {
        Text("\(value.formatted(.number)) %")
            .font(.system(size: 34))
            .fontWeight(.semibold)
    }
    
    private var batterySlider: some View {
        VStack {
            ChargingSliderView(value: $valueDegrees, minValue: 0, maxValue: 100, offset: $valueOffset)
                .tint(Color(.darkGray))
                .frame(width: 273)
                .onAppear {
                    let progressCircleConfig = UIImage.SymbolConfiguration(scale: .medium)
                    UISlider.appearance()
                        .setThumbImage(
                            UIImage(named: "slICahrging", variableValue: 0, configuration: progressCircleConfig), for: .normal)
                }
            Text("Set Charge Limit")
                .foregroundStyle(.gray)
        }

    }
    
    private var nearbySuperchargersView: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.clear)
                
                    .frame(width: 338, height: isShomNearby ? 320 : 130)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(.gray, lineWidth: 10)
                            .shadow(color: .black.opacity(0.8), radius: 6, x: 6, y: 6)
                            .shadow(color: .white.opacity(0.1), radius: 5, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0).inset(by: 5.5))
                    }
                    .offset(y: isShomNearby ? geometry.size.height / 2 - 150 : 0)
                    .animation(.linear(duration: 0.5), value: isShomNearby)

                HStack {
                    Text("Nearby Superchargers")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Spacer().frame(width: 20)
                    Button {
                        withAnimation {
                            isShomNearby.toggle()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40).fill(gradientForButton.opacity(0.55))
                                .frame(width: 44, height: 44)
                            Image(systemName: "chevron.up")
                                .rotationEffect(isShomNearby ? .degrees(180) : .degrees(0))
                                .accentColor(.gray)
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color.background))
                    .overlay {
                        Circle()
                            .stroke(darkGradientForBackground.opacity(0.55), lineWidth: 2)
                    }
                    .neumorphismSelectedBackCircule()
                }
                .offset(y: isShomNearby ? -95 : 0)
                
                //Spacer().frame(height: 90)
                
                if isShomNearby {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack {
                                Text("Tesla Supercharger -\nMontreal, QC")
                                    .foregroundStyle(.gray)
                                Text("2 / 4 available")
                                    .offset(x: -28)
                            }
                            Spacer().frame(width: 70)
                            Image(.geoIcon)
                        }
                        
                        Spacer().frame(height: 40)
                        HStack {
                            VStack {
                                Text("Tesla Supercharger -\nMontreal, QC")
                                    .foregroundStyle(.gray)
                                Text("2 / 2 available")
                                    .offset(x: -28)
                                    
                            }
                            Spacer().frame(width: 70)
                            Image(.geoIcon)
                        }
                    }
                    .offset(y: 30)
                }
            }
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
    ChargingView()
        .environment(\.colorScheme,  .dark)
}


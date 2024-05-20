//
//  ClimateControlSlider.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 15.05.2024.
//

import SwiftUI


struct TeslaSlider: View {
    @Binding var value: Int
    var range: ClosedRange<Double>
    var step: Double
    var activeTrackColor: Color
    var inactiveTrackColor: Color
    var thumbImage: Image
    var trackHeight: CGFloat
    var trackWidthMultiplier: CGFloat = 1.2 // Множитель ширины трека
    

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.black, .white.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: geometry.size.width * trackWidthMultiplier, height: trackHeight)
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        activeTrackColor
                    )
                    .frame(width: (CGFloat(Double(value) - range.lowerBound) / CGFloat(range.upperBound - range.lowerBound)) * geometry.size.width * trackWidthMultiplier, height: trackHeight)
                thumbImage
                    .offset(x: (CGFloat(Double(value) - range.lowerBound) / CGFloat(range.upperBound - range.lowerBound)) * geometry.size.width * trackWidthMultiplier - (trackHeight * trackWidthMultiplier) / 2)
                    .gesture(DragGesture().onChanged({ gestureValue in
                        let sliderWidth = geometry.size.width * trackWidthMultiplier
                        let newValue = gestureValue.location.x / sliderWidth
                        self.value = Int(min(max(Double(newValue) * (range.upperBound - range.lowerBound) + range.lowerBound, range.lowerBound), range.upperBound))
                    }))
            }
        }
    }
}






struct ChargingSliderView: View {
    @Binding private var value: Double
    @Binding var offset: Double
    
    @State private var lastOffset = 0.0
    private let minValue: Int
    private let maxValue: Int
    private let step = 1
    
    init(value: Binding<Double>, minValue: Int, maxValue: Int, offset: Binding<Double>) {
        _value = value
        self.minValue = minValue
        self.maxValue = maxValue
        
        _offset = offset
    }
    
    var body: some View {
        GeometryReader { reader in
            let maxSliderWidth = reader.size.width - 16
            
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.black, .white.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(height: 10)
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.01), .white.opacity(0.01)]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: offset, height: 10)
                    Image(.slICahrging)
                        .frame(width: 10)
                        .offset(x: offset, y: 5)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged({ dragValue in
                                    var translation = dragValue.translation.width + lastOffset
                                    translation = min(max(translation, 0), maxSliderWidth)
                                    let dragPercent = getDragPercent(translation: translation, of: maxSliderWidth)
                                        let valueNum = dragPercentToValue(dragPercent: dragPercent)
                                    value = Double(valueNum)
                                        offset = valueToFillPercent(valueNum) * maxSliderWidth
                                })
                                    
                                .onEnded({ _ in
                                    lastOffset = offset
                                })
                        )
                }
                .frame(height: 16)
            }
        }
        .frame(maxHeight: 30)
    }
    
    private func getDragPercent(translation: CGFloat, of maxWidth: CGFloat) -> CGFloat {
        translation / maxWidth
    }
    
    private func dragPercentToValue(dragPercent: CGFloat) -> Int {
        let actualValue = Int(dragPercent * Double(maxValue - minValue) + Double(minValue))
        let remainder = actualValue % step
        var roundedValue = actualValue
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if remainder < step / 2 {
                roundedValue = actualValue - remainder
            } else {
                roundedValue = actualValue - remainder + step
            }
        }
        return Int(roundedValue)
    }
    
    private func valueToFillPercent(_ result: Int) -> CGFloat {
        Double(result - minValue) / Double((maxValue - minValue))
    }
    
}









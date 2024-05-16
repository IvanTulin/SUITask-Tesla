//
//  DisclosureGroupView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import SwiftUI

struct DisclosureGroupView: View {
    var body: some View {
        ScrollView {
            Text("Текст который мы можем настроить")
                .foregroundStyle(selectedColor)
                .font(.title)
                .fontWeight(fontStyle)
                .padding(.top)
                .opacity(textOpacityValue)
            colorSettingsView
            fontSizeView
            opacitySettingsView
            readDocView
        }
    }
    
    @State private var selectedColor = Color.black
    @State private var fontStyle = Font.Weight.regular
    @State private var textOpacityValue = 1.0
    
    private var colorSettingsView: some View {
        DisclosureGroup {
            HStack {
                Label(
                    title: { Text("Выберите цвет текста") },
                    icon: { Image(systemName: "paintpalette.fill") }
                )
                ColorPicker("", selection: $selectedColor)
            }
            .padding(.top)
            
        } label: {
            Text("Настройка цвета")
        }
        .tint(.black)
        .padding()
    }
    
    private var fontSizeView: some View {
        DisclosureGroup {
            ControlGroup {
                Button(action: {
                    fontStyle = Font.Weight.regular
                }, label: {
                    Text("Regular")
                })
                Button(action: {
                    fontStyle = Font.Weight.bold
                }, label: {
                    Text("Bold")
                })
            }
            .padding(.top)
        } label: {
            Text("Настройка стиля шрифта")
        }
        .tint(.black)
        .padding()
    }
    
    private var opacitySettingsView: some View {
        DisclosureGroup {
            Stepper("Opacity: \(textOpacityValue.formatted(.percent))") {
                guard textOpacityValue < 1.0 else { return }
                textOpacityValue += 0.1
            } onDecrement: {
                guard textOpacityValue > 0.1 else { return }
                textOpacityValue -= 0.1
            }

        } label: {
            Text("Настройка прозрачности")
        }
        .tint(.black)
        .padding()
    }
    
    private var readDocView: some View {
        DisclosureGroup {
            if let url = URL(string: "https://developer.apple.com/documentation/swiftui/link") {
                Link("Почитать о Линке", destination: url)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                    .padding(.top)
            }

        } label: {
            Text("Дополнительно")
        }
        .tint(.black)
        .padding()
    }
}

#Preview {
    DisclosureGroupView()
}

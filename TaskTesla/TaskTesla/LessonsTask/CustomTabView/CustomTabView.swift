//
//  CustonTabView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI

struct TabItem: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var icon: String
}

struct TabItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}

struct TabItemModifier: ViewModifier {
    let tabBarItem: TabItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenceKey.self, value: [tabBarItem])
    }
}

extension View {
    func myTabItem(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifier(tabBarItem: label()))
    }
}

struct CustomTabView<Content: View>: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            HStack {
                tabsView
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.vertical, 5)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
            .cornerRadius(10)
            .shadow(radius: 8)
            .padding()
        }
        .onPreferenceChange(TabItemPreferenceKey.self, perform: { value in
            tabs = value
        })
    }
    
    @Binding var selection: Int
    
    @Namespace private var tabBarItem
    @State private var tabs: [TabItem] = [
        .init(text: "Домой", icon: "house.fill"),
        .init(text: "Избранное", icon: "star.fill"),
    ]
    
    private var content: Content
    private var tabsView: some View {
        ForEach(Array(tabs.enumerated()),id: \.offset) { index, element in
            Spacer()
            VStack(spacing: 5) {
                Image(systemName: element.icon)
                Text(element.text )
            }
            .foregroundColor(selection == index ? .black : .gray)
            .background(
                ZStack {
                    if selection == index {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow.opacity(0.4))
                            .frame(width: 70, height: 50)
                            .matchedGeometryEffect(id: "tabitems", in: tabBarItem)
                    }
                }
            )
            .onTapGesture {
                withAnimation {
                    selection = index
                }
            }
        }
    }
    
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
    
    
}


struct ContentView: View {
    @State var selection = 0
    
    var body: some View {
//        CustomTabView(selection: $selection) {
//            Color.red
//        }
//        .edgesIgnoringSafeArea(.bottom)
        
        CustomTabView(selection: $selection) {
            Color.red
            Text("Домой")
                .padding(.top, -400)
                .myTabItem {
                    TabItem(text: "Домой", icon: "house.fill")
                }
                .opacity(selection == 0 ? 1 : 0)
            
            Color.green
                .myTabItem {
                    TabItem(text: "Избранное", icon: "star.fill")
                }
                .opacity(selection == 1 ? 1 : 0)
            
            Color.blue
                .myTabItem {
                    TabItem(text: "Настройки", icon: "gearshape.fill")
                }
                .opacity(selection == 2 ? 1 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}

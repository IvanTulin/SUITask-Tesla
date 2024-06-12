//
//  CustonNavigationLink.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI
 
struct Item {
    let name: String
}

struct CustonNavigationLink: View {
    let item: Item?
    
    @State var isShowNextScreen = false
    @State var isShowItemScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                VStack {
                    Button(action: {
                        isShowNextScreen.toggle()
                    }, label: {
                        Text("Переход на сл экран")
                    })
                    
                    Button(action: {
                        isShowItemScreen.toggle()
                    }, label: {
                        Text("Переход на 3й экран")
                    })
                }
            }
            .navigationTitle("Первый экран")
            .navigation(destination: CustonNavigationLink2(), isActive: $isShowNextScreen)
            .navigation(model: item ?? Item(name: ""), isActive: $isShowItemScreen) { item in
                CustonNavigationLink3(item: item)
            }
        }
    }
}

struct CustonNavigationLink2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Второй экран")
    }
}

struct CustonNavigationLink3: View {
    var item: Item
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle(item.name)
    }
}

#Preview {
    CustonNavigationLink(item: Item(name: "Karl"))
}

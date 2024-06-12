//
//  TeslaTabItemModifier.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 12.06.2024.
//

import SwiftUI

struct TeslaTabItemModifier: ViewModifier {
    let tabBarItem: TeslaTabItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TeslaTabItemPreferenceKey.self, value: [tabBarItem])
    }
}

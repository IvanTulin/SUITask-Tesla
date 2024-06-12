//
//  TeslaTabItemPreferenceKey.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 12.06.2024.
//

import SwiftUI

struct TeslaTabItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TeslaTabItem] = []
    
    static func reduce(value: inout [TeslaTabItem], nextValue: () -> [TeslaTabItem]) {
        value += nextValue()
    }
}

//
//  ClimateSystemsModelView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 14.05.2024.
//

import Foundation

class ClimateSystemsViewModel: ObservableObject {
    @Published var nameSettings = ["Ac", "Fan", "Heat", "Auto"]
    @Published var images = ["ListBullet", "fanBullet", "heatBullet", "autoBullet"]
    @Published var degrees = [15, 15, 15, 15]
    @Published var offset: [Double] = [0, 0, 0, 0]
    @Published var degreeAc: Double = 15.0
    @Published var disabled: [Bool] = [false, true, true, true]
    
}

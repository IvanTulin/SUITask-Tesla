//
//  BlurView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 15.05.2024.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
   
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
}

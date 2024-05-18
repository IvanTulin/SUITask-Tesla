//
//  BatteryCharge.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 18.05.2024.
//

import SwiftUI

struct BatteryCharge: Shape {
   // var chargeLevel: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.02452*width, y: 0.60739*height))
        path.addLine(to: CGPoint(x: 0.02601*width, y: 0.9284*height))
        path.addCurve(to: CGPoint(x: 0.03299*width, y: 0.97561*height), control1: CGPoint(x: 0.02613*width, y: 0.95472*height), control2: CGPoint(x: 0.02922*width, y: 0.97561*height))
        path.addLine(to: CGPoint(x: 0.97203*width, y: 0.97561*height))
        path.addCurve(to: CGPoint(x: 0.97902*width, y: 0.92683*height), control1: CGPoint(x: 0.97589*width, y: 0.97561*height), control2: CGPoint(x: 0.97902*width, y: 0.95377*height))
        path.addLine(to: CGPoint(x: 0.97902*width, y: 0.60611*height))
        path.addCurve(to: CGPoint(x: 0.9786*width, y: 0.58952*height), control1: CGPoint(x: 0.97902*width, y: 0.60045*height), control2: CGPoint(x: 0.97888*width, y: 0.59484*height))
        path.addLine(to: CGPoint(x: 0.95097*width, y: 0.05658*height))
        path.addCurve(to: CGPoint(x: 0.9444*width, y: 0.02439*height), control1: CGPoint(x: 0.94997*width, y: 0.03726*height), control2: CGPoint(x: 0.94734*width, y: 0.02439*height))
        path.addLine(to: CGPoint(x: 0.06075*width, y: 0.02439*height))
        path.addCurve(to: CGPoint(x: 0.05422*width, y: 0.05572*height), control1: CGPoint(x: 0.05786*width, y: 0.02439*height), control2: CGPoint(x: 0.05526*width, y: 0.03685*height))
        path.addLine(to: CGPoint(x: 0.02498*width, y: 0.58837*height))
        path.addCurve(to: CGPoint(x: 0.02452*width, y: 0.60739*height), control1: CGPoint(x: 0.02465*width, y: 0.59444*height), control2: CGPoint(x: 0.02449*width, y: 0.6009*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.02452*width, y: 0.60739*height))
        path.addLine(to: CGPoint(x: 0.02601*width, y: 0.9284*height))
        path.addCurve(to: CGPoint(x: 0.03299*width, y: 0.97561*height), control1: CGPoint(x: 0.02613*width, y: 0.95472*height), control2: CGPoint(x: 0.02922*width, y: 0.97561*height))
        path.addLine(to: CGPoint(x: 0.97203*width, y: 0.97561*height))
        path.addCurve(to: CGPoint(x: 0.97902*width, y: 0.92683*height), control1: CGPoint(x: 0.97589*width, y: 0.97561*height), control2: CGPoint(x: 0.97902*width, y: 0.95377*height))
        path.addLine(to: CGPoint(x: 0.97902*width, y: 0.60611*height))
        path.addCurve(to: CGPoint(x: 0.9786*width, y: 0.58952*height), control1: CGPoint(x: 0.97902*width, y: 0.60045*height), control2: CGPoint(x: 0.97888*width, y: 0.59484*height))
        path.addLine(to: CGPoint(x: 0.95097*width, y: 0.05658*height))
        path.addCurve(to: CGPoint(x: 0.9444*width, y: 0.02439*height), control1: CGPoint(x: 0.94997*width, y: 0.03726*height), control2: CGPoint(x: 0.94734*width, y: 0.02439*height))
        path.addLine(to: CGPoint(x: 0.06075*width, y: 0.02439*height))
        path.addCurve(to: CGPoint(x: 0.05422*width, y: 0.05572*height), control1: CGPoint(x: 0.05786*width, y: 0.02439*height), control2: CGPoint(x: 0.05526*width, y: 0.03685*height))
        path.addLine(to: CGPoint(x: 0.02498*width, y: 0.58837*height))
        path.addCurve(to: CGPoint(x: 0.02452*width, y: 0.60739*height), control1: CGPoint(x: 0.02465*width, y: 0.59444*height), control2: CGPoint(x: 0.02449*width, y: 0.6009*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.02098*width, y: 0.58537*height))
        path.addLine(to: CGPoint(x: 0.02098*width, y: 0.70732*height))
        path.addLine(to: CGPoint(x: 0.02098*width, y: 0.58537*height))
//        path.closeSubpath()
        return path
    }
}

#Preview {
    BatteryCharge()
        .frame(width: 274, height: 39)
}

struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.02618*width, y: 0.61008*height))
        path.addLine(to: CGPoint(x: 0.02766*width, y: 0.93911*height))
        path.addCurve(to: CGPoint(x: 0.03462*width, y: 0.9875*height), control1: CGPoint(x: 0.02778*width, y: 0.96608*height), control2: CGPoint(x: 0.03086*width, y: 0.9875*height))
        path.addLine(to: CGPoint(x: 0.97038*width, y: 0.9875*height))
        path.addCurve(to: CGPoint(x: 0.97735*width, y: 0.9375*height), control1: CGPoint(x: 0.97423*width, y: 0.9875*height), control2: CGPoint(x: 0.97735*width, y: 0.96511*height))
        path.addLine(to: CGPoint(x: 0.97735*width, y: 0.60877*height))
        path.addCurve(to: CGPoint(x: 0.97694*width, y: 0.59176*height), control1: CGPoint(x: 0.97735*width, y: 0.60296*height), control2: CGPoint(x: 0.97721*width, y: 0.59721*height))
        path.addLine(to: CGPoint(x: 0.9494*width, y: 0.04549*height))
        path.addCurve(to: CGPoint(x: 0.94285*width, y: 0.0125*height), control1: CGPoint(x: 0.9484*width, y: 0.02569*height), control2: CGPoint(x: 0.94578*width, y: 0.0125*height))
        path.addLine(to: CGPoint(x: 0.06228*width, y: 0.0125*height))
        path.addCurve(to: CGPoint(x: 0.05578*width, y: 0.04462*height), control1: CGPoint(x: 0.0594*width, y: 0.0125*height), control2: CGPoint(x: 0.05681*width, y: 0.02527*height))
        path.addLine(to: CGPoint(x: 0.02664*width, y: 0.59058*height))
        path.addCurve(to: CGPoint(x: 0.02618*width, y: 0.61008*height), control1: CGPoint(x: 0.0263*width, y: 0.5968*height), control2: CGPoint(x: 0.02615*width, y: 0.60343*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.02618*width, y: 0.61008*height))
        path.addLine(to: CGPoint(x: 0.02766*width, y: 0.93911*height))
        path.addCurve(to: CGPoint(x: 0.03462*width, y: 0.9875*height), control1: CGPoint(x: 0.02778*width, y: 0.96608*height), control2: CGPoint(x: 0.03086*width, y: 0.9875*height))
        path.addLine(to: CGPoint(x: 0.97038*width, y: 0.9875*height))
        path.addCurve(to: CGPoint(x: 0.97735*width, y: 0.9375*height), control1: CGPoint(x: 0.97423*width, y: 0.9875*height), control2: CGPoint(x: 0.97735*width, y: 0.96511*height))
        path.addLine(to: CGPoint(x: 0.97735*width, y: 0.60877*height))
        path.addCurve(to: CGPoint(x: 0.97694*width, y: 0.59176*height), control1: CGPoint(x: 0.97735*width, y: 0.60296*height), control2: CGPoint(x: 0.97721*width, y: 0.59721*height))
        path.addLine(to: CGPoint(x: 0.9494*width, y: 0.04549*height))
        path.addCurve(to: CGPoint(x: 0.94285*width, y: 0.0125*height), control1: CGPoint(x: 0.9484*width, y: 0.02569*height), control2: CGPoint(x: 0.94578*width, y: 0.0125*height))
        path.addLine(to: CGPoint(x: 0.06228*width, y: 0.0125*height))
        path.addCurve(to: CGPoint(x: 0.05578*width, y: 0.04462*height), control1: CGPoint(x: 0.0594*width, y: 0.0125*height), control2: CGPoint(x: 0.05681*width, y: 0.02527*height))
        path.addLine(to: CGPoint(x: 0.02664*width, y: 0.59058*height))
        path.addCurve(to: CGPoint(x: 0.02618*width, y: 0.61008*height), control1: CGPoint(x: 0.0263*width, y: 0.5968*height), control2: CGPoint(x: 0.02615*width, y: 0.60343*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.02265*width, y: 0.5875*height))
        path.addLine(to: CGPoint(x: 0.97735*width, y: 0.5875*height))
        path.addLine(to: CGPoint(x: 0.97735*width, y: 0.7125*height))
        path.addLine(to: CGPoint(x: 0.02265*width, y: 0.7125*height))
        path.addLine(to: CGPoint(x: 0.02265*width, y: 0.5875*height))
        path.closeSubpath()
        return path
    }
}

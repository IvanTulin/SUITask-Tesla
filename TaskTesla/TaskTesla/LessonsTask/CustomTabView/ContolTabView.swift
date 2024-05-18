//
//  ContolTabView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI

struct ContolTabView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.45158*height))
        path.addCurve(to: CGPoint(x: 0.00927*width, y: 0.33627*height), control1: CGPoint(x: 0, y: 0.40861*height), control2: CGPoint(x: 0.00332*width, y: 0.36729*height))
        path.addLine(to: CGPoint(x: 0.04192*width, y: 0.1659*height))
        path.addCurve(to: CGPoint(x: 0.11967*width, y: 0), control1: CGPoint(x: 0.06223*width, y: 0.05992*height), control2: CGPoint(x: 0.09032*width, y: 0))
        path.addLine(to: CGPoint(x: 0.31879*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.38029*width, y: 0.09644*height), control1: CGPoint(x: 0.34078*width, y: 0), control2: CGPoint(x: 0.36224*width, y: 0.03365*height))
        path.addLine(to: CGPoint(x: 0.43411*width, y: 0.28363*height))
        path.addCurve(to: CGPoint(x: 0.56589*width, y: 0.28363*height), control1: CGPoint(x: 0.47372*width, y: 0.4214*height), control2: CGPoint(x: 0.52628*width, y: 0.4214*height))
        path.addLine(to: CGPoint(x: 0.61971*width, y: 0.09644*height))
        path.addCurve(to: CGPoint(x: 0.68121*width, y: 0), control1: CGPoint(x: 0.63776*width, y: 0.03365*height), control2: CGPoint(x: 0.65922*width, y: 0))
        path.addLine(to: CGPoint(x: 0.88033*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.95808*width, y: 0.1659*height), control1: CGPoint(x: 0.90968*width, y: 0), control2: CGPoint(x: 0.93777*width, y: 0.05992*height))
        path.addLine(to: CGPoint(x: 0.99073*width, y: 0.33627*height))
        path.addCurve(to: CGPoint(x: width, y: 0.45158*height), control1: CGPoint(x: 0.99668*width, y: 0.36729*height), control2: CGPoint(x: width, y: 0.40861*height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0.45158*height))
        return path
    }
}

#Preview {
    ContolTabView()
        .fill(.red)
        .environment(\.colorScheme,  .dark)
        .frame(width: 400, height: 60)
}

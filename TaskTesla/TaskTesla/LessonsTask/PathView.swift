//
//  PathView.swift
//  TaskTesla
//
//  Created by Ivan Tulin on 16.05.2024.
//

import SwiftUI

struct MyDivider: View {
    let lineWidth: CGFloat
    var color = Color.red
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                path.move(to: CGPoint(x: 20, y: 50))
                path.addLine(to: CGPoint(x: proxy.size.width - 20, y: 50))
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
        .foregroundColor(color)
        }
    }
}

struct TriangleView: View {
    var body: some View {
        GeometryReader { proxy in
            let midX = proxy.frame(in: .local).midX
            let width: CGFloat = 200
            
            Path { path in
                path.move(to: CGPoint(x: midX, y: 10))
                path.addLine(to: CGPoint(x: midX + (width / 2), y: 170))
                path.addLine(to: CGPoint(x: midX - (width / 2), y: 170))
                path.closeSubpath()
            }
            //.stroke(style: StrokeStyle(lineWidth: 5))
            //.foregroundColor(.blue)
            .fill (.blue)
        }
    }
}

struct RectangleView: View {
    var body: some View {
        GeometryReader { proxy in
            let midX = proxy.frame(in: .local).midX
            let width: CGFloat = 200
            
            Path { path in
                path.addRect(CGRect(x: 10, y: 100, width: proxy.size.width - 20, height: 200))
            }
            .fill (.orange)
        }
    }
}

struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.width * 0.65, y: 0)
        
        path.move(to: startPoint)
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height / 2),
                      control1: CGPoint(x: rect.width * 0.85, y: 0),
                      control2: CGPoint(x: rect.width, y: rect.height * 0.1))
        path.addCurve(to: CGPoint(x: rect.width / 2, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.height * 0.9),
                      control2: CGPoint(x: rect.width * 0.75, y: rect.height))
        path.addCurve(to: CGPoint(x: 0, y: rect.height * 0.7),
                      control1: CGPoint(x: rect.width * 0.35, y: rect.height),
                      control2: CGPoint(x: 0, y: rect.height))
        path.addCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
                      control1: CGPoint(x: 0, y: rect.height * 0.4),
                      control2: CGPoint(x: rect.width * 0.17, y: rect.height * 0.45 ))
        path.addCurve(to: startPoint,
                      control1: CGPoint(x: rect.width * 0.42, y: rect.height * 0.16),
                      control2: CGPoint(x: rect.width * 0.46, y: 0))
        return path
    }
}

struct RoundedBottomRectangle: Shape {
    var curneOffset: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + curneOffset))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}

struct DomeShape: Shape {
    var progress: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRelativeArc(center: CGPoint(x: rect.midX, y: rect.maxY),
                            radius: rect.midX,
                            startAngle: .degrees(180),
                            delta: .degrees(180 *  progress))
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct LogoTeslaView: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + 17, y: rect.minY + 68))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX - 37, y: rect.minY + 37), control: CGPoint(x: rect.midX / 2, y: rect.minY + 35))
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + 80))
        path.addLine(to: CGPoint(x: rect.midX + 37, y: rect.minY + 35))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 15, y: rect.minY + 60), control: CGPoint(x: rect.midX + (rect.midX / 2) , y: rect.minY + 37))
        
        return path
    }
}


struct PathView: View {
    let gradient = LinearGradient(colors: [Color.pink, Color.purple], startPoint: .topTrailing, endPoint: .bottomLeading)
    
    @State var progress = 0.0
    
    var body: some View {
        //MyDivider(lineWidth: 2, color: .red)
        
        //TriangleView()
        
        //RectangleView()
        
//        ZStack {
//            CurvedShape()
//                .fill(gradient)
//            CurvedShape()
//                .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round, dash: [60, 35]))
//                // .rotationEffect(.degrees(-10))
//        }
//        .frame(width: 290, height: 300)
        
//        VStack {
//            RoundedBottomRectangle(curneOffset: 30)
//                .fill(gradient)
//                .frame(height: 120)
//                .shadow(radius: 8)
//                .overlay {
//                    Text("SwiftUI")
//                        .font(.largeTitle)
//                        .foregroundStyle(.white)
//                        .padding(.top, 40)
//                }
//                .edgesIgnoringSafeArea(.top)
//            Spacer()
//        }
        
//        DomeShape(progress: 1)
//            .trim(from: 0, to: progress)
//            .stroke(.purple, lineWidth: 5)
//            .frame(height: 196)
//            .background(Color(.systemGray5))
//        Slider(value: $progress)
//            .padding( )
        
        LogoTeslaView()
            .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
        
    }
}

#Preview {
    PathView()
}

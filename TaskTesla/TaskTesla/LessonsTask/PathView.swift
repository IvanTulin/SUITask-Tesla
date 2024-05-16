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

struct LogoTeslaTwo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.22347*height))
        path.addLine(to: CGPoint(x: 0.60319*width, y: 0.09734*height))
        path.addCurve(to: CGPoint(x: 0.95606*width, y: 0.18297*height), control1: CGPoint(x: 0.60319*width, y: 0.09734*height), control2: CGPoint(x: 0.77994*width, y: 0.10109*height))
        path.addCurve(to: CGPoint(x: 0.82147*width, y: 0.28453*height), control1: CGPoint(x: 0.91097*width, y: 0.25116*height), control2: CGPoint(x: 0.82147*width, y: 0.28453*height))
        path.addCurve(to: CGPoint(x: 0.64*width, y: 0.21*height), control1: CGPoint(x: 0.81544*width, y: 0.22462*height), control2: CGPoint(x: 0.77347*width, y: 0.21*height))
        path.addLine(to: CGPoint(x: 0.50003*width, y: 1.00003*height))
        path.addLine(to: CGPoint(x: 0.35909*width, y: 0.20984*height))
        path.addCurve(to: CGPoint(x: 0.17859*width, y: 0.28437*height), control1: CGPoint(x: 0.22659*width, y: 0.20984*height), control2: CGPoint(x: 0.18462*width, y: 0.2245*height))
        path.addCurve(to: CGPoint(x: 0.044*width, y: 0.18313*height), control1: CGPoint(x: 0.17859*width, y: 0.28437*height), control2: CGPoint(x: 0.08906*width, y: 0.25134*height))
        path.addCurve(to: CGPoint(x: 0.39687*width, y: 0.0975*height), control1: CGPoint(x: 0.22009*width, y: 0.10125*height), control2: CGPoint(x: 0.39687*width, y: 0.0975*height))
        path.addLine(to: CGPoint(x: 0.50006*width, y: 0.22347*height))
        path.addLine(to: CGPoint(x: 0.49991*width, y: 0.22347*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.22347*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5*width, y: 0.06103*height))
        path.addCurve(to: CGPoint(x: 0.972*width, y: 0.15591*height), control1: CGPoint(x: 0.64225*width, y: 0.05972*height), control2: CGPoint(x: 0.80519*width, y: 0.083*height))
        path.addCurve(to: CGPoint(x: width, y: 0.09781*height), control1: CGPoint(x: 0.99431*width, y: 0.11553*height), control2: CGPoint(x: width, y: 0.09781*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: 0.81772*width, y: 0.02553*height), control2: CGPoint(x: 0.64697*width, y: 0.00066*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.09781*height), control1: CGPoint(x: 0.35303*width, y: 0.00066*height), control2: CGPoint(x: 0.18228*width, y: 0.02541*height))
        path.addCurve(to: CGPoint(x: 0.028*width, y: 0.15609*height), control1: CGPoint(x: 0, y: 0.09781*height), control2: CGPoint(x: 0.00813*width, y: 0.11978*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.06088*height), control1: CGPoint(x: 0.19484*width, y: 0.08284*height), control2: CGPoint(x: 0.35775*width, y: 0.05975*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.06103*height))
        path.closeSubpath()
        return path
    }
}


struct PathView: View {
    let gradient = LinearGradient(colors: [Color.pink, Color.purple], startPoint: .topTrailing, endPoint: .bottomLeading)
    
    @State private var isAnimating = false
    
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
        
//        LogoTeslaView()
//            .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
        
        LogoTeslaTwo()
            .trim(from: 0, to: isAnimating ? 1 : 0)
            .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
//            .fill(.gray)
            .frame(width: 380, height: 380)
            
            
        
    }
}

#Preview {
    PathView()
}


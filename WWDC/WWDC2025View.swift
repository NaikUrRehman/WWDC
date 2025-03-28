//
//  ContentView.swift
//  WWDC
//
//  Created by user on 28/03/2025.
//

import SwiftUI

struct WWDC2025View: View {
    @State private var animate = false
    @State private var shimmer = false
    @State private var glowPulse = false
    @State private var randomRotation = Double.random(in: -10...10) // Random rotation speed effect
    
    var body: some View {
        ZStack {
            // Animated Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue, Color.cyan, Color.indigo]),
                           startPoint: animate ? .topLeading : .bottomTrailing,
                           endPoint: animate ? .bottomTrailing : .topLeading)
                .edgesIgnoringSafeArea(.all)
                .animation(.linear(duration: 3).repeatForever(autoreverses: true), value: animate)
                
            VStack(spacing: -10) {
                Text("WWDC")
                    .font(.system(size: 70, weight: .black, design: .rounded))
                
                Text("2025")
                    .font(.system(size: 70, weight: .black, design: .rounded))
                
                Text("Apple Developer Conference")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 10)
                
                Text("June 2025 | Innovation Unveiled")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.top, 5)
            }
            .foregroundStyle(
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow, Color.orange, Color.red]), startPoint: .top, endPoint: .bottom)
            )
            .scaleEffect(animate ? 1.3 : 0.9)
            .opacity(animate ? 1 : 0.8)
            .shadow(color: .white.opacity(0.9), radius: glowPulse ? 30 : 20, x: 0, y: 0)
            .rotation3DEffect(
                .degrees(animate ? randomRotation : 0),
                axis: (x: 1.0, y: 1.0, z: 0.0)
            )
            .overlay(
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .mask(
                        VStack(spacing: -10) {
                            Text("WWDC").font(.system(size: 70, weight: .black, design: .rounded))
                            Text("2025").font(.system(size: 70, weight: .black, design: .rounded))
                        }
                    )
                    .offset(x: shimmer ? 300 : -300)
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: shimmer)
            )
            .onAppear {
                animate.toggle()
                shimmer.toggle()
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    glowPulse.toggle()
                }
            }
            
            // Particle Effect
            ForEach(0..<20, id: \ .self) { _ in
                Circle()
                    .fill(Color.white.opacity(0.5))
                    .frame(width: CGFloat.random(in: 5...10), height: CGFloat.random(in: 5...10))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
            }
        }
    }
}

struct WWDC2025View_Previews: PreviewProvider {
    static var previews: some View {
        WWDC2025View()
    }
}

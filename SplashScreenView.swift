//
//  SplashScreenView.swift
//  MotionOfTheDay
//
//  Created by Gabriel Saucedo on 8/27/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Text("Motion of the Day")
                        .font(Font.custom("Bumbbled", size: 42, relativeTo: .title))
                    Text("An App By Gabriel Saucedo")
                        .font(.headline)
                }
                .offset(y: -32)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}

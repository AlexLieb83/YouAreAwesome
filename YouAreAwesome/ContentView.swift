//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Alex Liebhaber on 10/30/25.
//

import SwiftUI

struct ContentView: View {
    //    @State private var message = "I am a programmer"
    @State private var message = ""
    @State private var imageName = ""
    @State private var buttonPressed = false
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            
            Button("Press Me") {
                buttonPressed.toggle()
                
                if buttonPressed {
                    message = "You Are Awesome"
                    imageName = "sun.max.fill"
                } else {
                    message = "You Are Great"
                    imageName = "hand.thumbsup"
                }
            }
            .buttonStyle(.glassProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}

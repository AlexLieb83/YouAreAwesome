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
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Press Me") {
                buttonPressed.toggle()
                
                message = buttonPressed ? "You Are Awesome" : "You Are Great"
                imageName = buttonPressed ? "image0" : "image1"
            }
            .buttonStyle(.glassProminent)
            .font(.title2)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}

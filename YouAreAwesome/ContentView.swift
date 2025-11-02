 //
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Alex Liebhaber on 10/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("You are awesome!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.cyan)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

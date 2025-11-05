//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Alex Liebhaber on 10/30/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    //    @State private var message = "I am a programmer"
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 9 // images labeled image0 - image9
    let numberOfSounds = 6 // sounds labeled sound0 - sound5
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5 )
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome",
                                "You Are Amazing",
                                "You Are Fantastic",
                                "Keep Up The Good Work"]
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count - 1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...numberOfImages - 1)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSounds - 1)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                soundName = "sound\(soundNumber)"
                
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("Could not load sound file: \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
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

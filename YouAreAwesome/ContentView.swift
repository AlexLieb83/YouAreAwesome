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
    @State private var soundIsOn = true
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
            
            HStack {
                Text("Sound On:")
                
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { oldValue, newValue in
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    let messages = ["You Are Awesome",
                                    "You Are Amazing",
                                    "You Are Fantastic",
                                    "Keep Up The Good Work"]
                    
                    
                    lastMessageNumber = nonRepeatingNumber(
                        lastNumber: lastMessageNumber,
                        upperBound: messages.count - 1
                    )
                    message = messages[lastMessageNumber]
                    
                    
                    lastImageNumber = nonRepeatingNumber(
                        lastNumber: lastImageNumber,
                        upperBound: numberOfImages - 1
                    )
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingNumber(
                        lastNumber: lastSoundNumber,
                        upperBound: numberOfSounds - 1
                    )
                    
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                        
                }
                .buttonStyle(.glassProminent)
                .font(.title2)
            }
        }
        .padding()
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        
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
    
    func nonRepeatingNumber(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        
        return newNumber
    }
}

#Preview {
    ContentView()
}

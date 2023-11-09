//
//  ContentView.swift
//  TextToSpeech-OpenAI
//
//  Created by Ayush Singh on 08/11/23.
//

import SwiftUI
import Foundation
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var audioData: Data? // Store the MP3 data
    @State private var isPlaying: Bool = false // Track audio playback
    let openaiAPIKey = APIKeys.openaiAPIKey
    var body: some View {
        VStack {
            Button("Generate & Play") {
                generateAudio()
            }
            if let audioData = audioData {
                Button(isPlaying ? "Stop" : "Play") {
                    DispatchQueue.main.async {
                        isPlaying.toggle()
                        if isPlaying {
                            do {
                                try AVAudioSession.sharedInstance().setCategory(.playback)
                                try AVAudioSession.sharedInstance().setActive(true)
                                
                                audioPlayer = try AVAudioPlayer(data: audioData)
                                audioPlayer?.play()
                            } catch {
                                print("Error playing audio: \(error)")
                            }
                        } else {
                            audioPlayer?.stop()
                        }
                    }

                    
                }
            }
        }
    }
    
    // Function to make API call and generate audio
    func generateAudio() {
        guard let url = URL(string: "https://api.openai.com/v1/audio/speech") else {
            print("Invalid URL")
            return
        }
        
        let parameters: [String: Any] = [
            "model": "tts-1",
            "input": "Today is a wonderful day to build something people love!",
            "voice": "alloy"
        ]
        
        let headers: [String: String] = [
            "Authorization": "Bearer \(openaiAPIKey)",
            "Content-Type": "application/json"
        ]
        
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                self.audioData = data
                print("Audio data received")
            } else if let error = error {
                print("Error: \(error)")
            }
        }.resume()
    }
    
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


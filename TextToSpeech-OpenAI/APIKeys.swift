//
//  APIKeys.swift
//  TextToSpeech-OpenAI
//
//  Created by Ayush Singh on 09/11/23.
//

struct APIKeys {
    #if DEBUG
    static let openaiAPIKey = "your_debug_api_key_here"
    #else
    static let openaiAPIKey = "your_release_api_key_here"
    #endif
}

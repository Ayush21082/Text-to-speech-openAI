# TextToSpeech-OpenAI

TextToSpeech-OpenAI is a SwiftUI application that leverages the OpenAI API to generate and play text-to-speech audio. The app allows you to input a text, send it to the OpenAI API, and play the generated audio.

## Getting Started

### Prerequisites

- Xcode installed on your machine.

### Installation

1. Clone the repository to your local machine.

    ```bash
    git clone https://github.com/your-username/TextToSpeech-OpenAI.git
    ```

2. Open the project in Xcode.

    ```bash
    cd TextToSpeech-OpenAI
    open TextToSpeech-OpenAI.xcodeproj
    ```

### Configuration

1. **OpenAI API Key:**
   Obtain an API key from OpenAI. If you don't have one, sign up at [OpenAI](https://www.openai.com/).

2. **Set API Key:**
   Replace your OpenAI API key in the `APIKeys` structure inside `ContentView.swift`:

    ```swift
    struct APIKeys {
        #if DEBUG
        static let openaiAPIKey = "your_debug_api_key_here"
        #else
        static let openaiAPIKey = "your_release_api_key_here"
        #endif
    }
    ```

### Usage

1. Run the app in Xcode.

2. Enter the text you want to convert to speech.

3. Click the "Generate & Play" button to generate the audio.

4. Click the "Play" button to listen to the generated audio.

### Additional Notes

- The app uses environment variables to manage API keys securely. Make sure to keep your API keys private and avoid sharing them publicly.

- For more detailed information about the OpenAI Text-to-Speech API, refer to the [OpenAI Text-to-Speech Documentation](https://platform.openai.com/docs/guides/text-to-speech?lang=curl).

- If you encounter any issues or have suggestions for improvements, feel free to open an issue.

Happy coding!

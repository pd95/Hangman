//
//  PlayingScreen.swift
//  Hangman
//
//  Created by Philipp on 25.04.22.
//

import SwiftUI

struct PlayingScreen: View {
    @Binding var state: GameState

    @State private var nextCharacter = ""

    var body: some View {
        VStack {
            if case let .running(_, characters, _) = state {

                Hangman(state: state)

                Text("Type your next character:")
                ZStack {
                    TextField("", text: $nextCharacter)
                        .labelsHidden()
                        .textCase(.uppercase)
                        .textInputAutocapitalization(.characters)
                        .disableAutocorrection(true)
                        //.onSubmit(chooseCharacter)
                        .padding()
                        .foregroundColor(.clear)

                    Text(nextCharacter)
                        .font(.largeTitle)

                }
                .onChange(of: nextCharacter, perform: { newValue in
                    if characters.contains(newValue) {
                        nextCharacter = ""
                    } else {
                        chooseCharacter()
                    }
                })
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.accentColor)
                )
                .padding()
            }

            Spacer()

        }
    }

    private func chooseCharacter() {
        guard let character = nextCharacter.last else { return }
        state = update(state: state, action: .choose(character: String(character)))
        nextCharacter = ""
    }
}


struct PlayingScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayingScreen(state: .constant(.running(word: "BLACK FRIDAY", characters: "BEAFYILPKH", errors: 3)))
    }
}
//
//  EndScreen.swift
//  Hangman
//
//  Created by Philipp on 25.04.22.
//

import SwiftUI

struct EndScreen: View {
    @Binding var state: GameState

    var body: some View {
        VStack {
            Hangman(state: state)

            if case .done(let won, _, _, _) = state {
                if won {
                    Text("Well done,")
                    Text("You win!")
                        .font(.largeTitle)
                } else {
                    Text("Oh dear... you loose.")
                    Text("Try again?")
                        .font(.title3)

                }
            }

            Button(action: restart) {
                Text("Play again")
                    .font(.title2)
            }
            .padding()
            .buttonStyle(.borderedProminent)

            Spacer()
        }
    }

    private func restart() {
        state = update(state: state, action: .startGame)
    }
}

struct EndScreen_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EndScreen(state: .constant(.done(won: false, word: "BLACK FRIDAY", characters: "BEAFYILPKHON", errors: 5)))

            Divider()

            EndScreen(state: .constant(.done(won: true, word: "BLACK FRIDAY", characters: "BEPAFYILCKRID", errors: 2)))

        }
    }
}

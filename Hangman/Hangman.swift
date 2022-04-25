//
//  Hangman.swift
//  Hangman
//
//  Created by Philipp on 25.04.22.
//

import SwiftUI

struct Hangman: View {
    let state: GameState

    var body: some View {

        VStack {
            HStack(spacing: 0) {
                ForEach(Array(state.wordTemplate.enumerated()), id: \.offset) { index, character in
                    Text(character)
                }
            }.font(.system(.title, design: .monospaced))

            Divider()

            HStack {
                ForEach(Array(state.wrongCharacters.enumerated()), id: \.offset) { index, character in
                    Text(character)
                }
                Spacer()
                Text("\(state.errors)")
            }
            .font(.title3)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke()
        )
        .padding()
    }
}



struct Hangman_Previews: PreviewProvider {
    static var previews: some View {
        Hangman(state: .running(word: "BLACK FRIDAY", characters: "BEAFY", errors: 1))
    }
}

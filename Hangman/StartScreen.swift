//
//  StartScreen.swift
//  Hangman
//
//  Created by Philipp on 25.04.22.
//

import SwiftUI

struct StartScreen: View {
    @Binding var state: GameState

    //@AppStorage("playerName") var playerName: String = ""

    var body: some View {
        VStack {
//            Text("What is your name?")
//                .frame(maxWidth: .infinity, alignment: .leading)
//            TextField("Player name", text: $game.playerName)
//                .textFieldStyle(.roundedBorder)
//            Spacer()

            Button(action: start) {
                Text("Start game")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
      }
        .padding()
    }

    private func start() {
        state = update(state: state, action: .startGame)
    }
}


struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(state: .constant(.readyToStart))
    }
}

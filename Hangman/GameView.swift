//
//  GameView.swift
//  Hangman
//
//  Created by Philipp on 25.04.22.
//

import SwiftUI

struct GameView: View {
    @State private var state: GameState = .readyToStart

    var body: some View {
        if case .readyToStart = state {
            StartScreen(state: $state)
        }
        else if case .running = state {
            PlayingScreen(state: $state)
        }
        else {
            EndScreen(state: $state)
        }
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

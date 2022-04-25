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
                .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading)))
        }
        else if case .running = state {
            PlayingScreen(state: $state)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
        else {
            EndScreen(state: $state)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .top)))
        }
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

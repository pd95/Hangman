//
//  ContentView.swift
//  Hangman
//
//  Created by Philipp on 24.04.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GameView()
                .navigationTitle("Hangman")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

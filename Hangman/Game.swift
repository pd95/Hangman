//
//  Game.swift
//  Hangman
//
//  Created by Philipp on 25.04.22.
//

import SwiftUI

enum GameState: Equatable {
    case readyToStart
    case running(word: String, characters: String, errors: Int)
    case done(won: Bool, word: String, characters: String, errors: Int)

    var word: String {
        switch self {
        case .running(let word, _, _):
            return word
        case .done(_, let word, _, _):
            return word

        default:
            return ""
        }
    }

    var characters: String {
        switch self {
        case .running(_, let characters, _):
            return characters
        case .done(_, _, let characters, _):
            return characters

        default:
            return ""
        }
    }

    var errors: Int {
        switch self {
        case .running(_, _, let errors):
            return errors
        case .done(_, _, _, let errors):
            return errors

        default:
            return 0
        }
    }

    
    var wordTemplate: [String] {
        switch self {
        case .running(let word, let characters, _), .done(_, let word, let characters, _):
            return word.map { character in
                if character == " " { return " " }
                if characters.contains(character) {
                    return String(character)
                }
                return "_"
            }

        default:
            return []
        }
    }

    var wrongCharacters: [String] {
        switch self {
        case .running(let word, let characters, _), .done(_, let word, let characters, _):
            return characters.filter({ word.contains($0) == false }).map(String.init)

        default:
            return []
        }
    }
}

enum GameAction {
    case startGame
    case choose(character: String)
    case startOver
}

let words: [String] = [
    "Bahnhof", "Fernsehen", "Geschichte", "Wandtafel", "Vogelhaus"
]

func update(state: GameState, action: GameAction) -> GameState {

    let newState: GameState
    switch (state, action) {

    case (.readyToStart, .startGame), (.done, .startGame):
        let word = words.randomElement()!.uppercased()
        print("Searching ", word)
        newState = .running(word: word, characters: "", errors: 0)

    case let (.running(word, characters, errors), .choose(character: character)):

        print("Chosen", character)
        let newCharacters = characters.appending(character)
        let firstMissingCharacter = word.first(where: { newCharacters.firstIndex(of: $0) == nil })
        let newErrors = errors + (word.contains(character) ? 0 : 1)

        if firstMissingCharacter == nil {
            print("You win!")
            newState = .done(won: true, word: word, characters: newCharacters, errors: errors)
        } else {
            if newErrors == 5 {
                print("Game over")
                newState = .done(won: false, word: word, characters: newCharacters, errors: newErrors)
            } else {
                newState = .running(word: word, characters: newCharacters, errors: newErrors)
            }
        }

    case (.done, .startOver):
        newState = .readyToStart

    default:
        fatalError("Invalid combination of state and action: \(state) \(action)")
    }

    print("wordTemplate", state.wordTemplate)

    return newState
}

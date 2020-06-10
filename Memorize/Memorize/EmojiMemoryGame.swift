//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrea Stevanato on 25/05/2020.
//  Copyright © 2020 Andrea Stevanato. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    // Everytime object change, the property wrapper (@Published) calls objectWillChange.send()
    // To avoid the several calls of objectWillChange.send() we use @Published on the model
    @Published private var model: MemoryGame<String> = createMemoryGame()

    // Type function, does not manage any app state
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🥶", "🚀", "🎉", "🍟"]
        let numberOfPairsOfCards = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards,
                                  cardContentFactory: { pairIndex in emojis[pairIndex] })
    }

    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}

//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andrea Stevanato on 25/05/2020.
//  Copyright © 2020 Andrea Stevanato. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }

        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }

    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMacthed {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMacthed = true
                    cards[potentialMatchIndex].isMacthed = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }

    struct Card: Identifiable {
        var id: Int
        var content: CardContent

        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    startUsingBonustime()
                } else {
                    stoptUsingBonustime()
                }
            }
        }

        var isMacthed: Bool = false {
            didSet {
                stoptUsingBonustime()
            }
        }

        // MARK: - Bonus time

        // can be zero which means "no bonus available" for this card
        var bonusTimeLimit: TimeInterval = 6

        // how long this card has ever been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }

        var lastFaceUpDate: Date?

        var pastFaceUpTime: TimeInterval = 0

        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }

        // percentage of bonus time remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }

        var hasEarnedBonus: Bool {
             isMacthed && bonusTimeRemaining > 0
        }

        var isConsumingBonusTime: Bool {
             isFaceUp && !isMacthed && bonusTimeRemaining > 0
        }

        private mutating func startUsingBonustime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }

        private mutating func stoptUsingBonustime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
    }
}



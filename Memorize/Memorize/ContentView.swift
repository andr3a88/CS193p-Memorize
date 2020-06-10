//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrea Stevanato on 21/05/2020.
//  Copyright © 2020 Andrea Stevanato. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame

    var body: some View {
        HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font( viewModel.cards.count == 10 ? Font.title : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

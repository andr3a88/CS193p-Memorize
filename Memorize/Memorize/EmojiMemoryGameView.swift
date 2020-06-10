//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrea Stevanato on 21/05/2020.
//  Copyright © 2020 Andrea Stevanato. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    // Every time objectWillChange.send() called redraws only the cards involved
    // How SwiftUI figure out which cards redraw? The ForEach are requires that the cards are "Identifiable"
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    self.viewModel.resetGame()
                }
            }, label: { Text("New game") })
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMacthed {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90),
                    endAngle: Angle.degrees(180-90),
                    clockWise: true).padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMacthed ? 360 : 0))
                    .animation( card.isMacthed ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }

    // MARK: - Drawing Costants

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

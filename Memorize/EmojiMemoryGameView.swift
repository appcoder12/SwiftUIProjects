//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Prasoon Puri on 06/11/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    //let emojis: Array<String> = ["😀", "👻", "🎃", "🤡", "🤖","💩","👽","🤠","💀"]
//    @State var cardCount: Int = 6
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
            //cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        return HStack {
            //cardRemover
            Spacer()
            //cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
//    func cardCountAdjuster(by offSet: Int, symbol: String) -> some View {
//        Button(action: {
//                cardCount += offSet
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offSet < 1 || cardCount + offSet > viewModel.cards.count)
//    }
    
    var cards: some View {
       
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 0)],spacing: 0, content: {
    //return LazyVGrid(columns: [GridItem(), GridItem()], content: {
        ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        })
        .foregroundColor(.orange)
    }
//    var cardRemover: some View {
//        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }
//    var cardAdder: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
}

struct CardView: View {
    
    let card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack(content: {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12.0)
            //            if isFaceUp {
            //                Text(content)
            //                    .font(.largeTitle)
            //                base.strokeBorder(lineWidth: 2)
            //            } else {
            //                Text(content)
            //                    .font(.largeTitle)
            //                    .opacity(1)
            //                base.strokeBorder(lineWidth: 2)
            //                    .fill()
            //            }
           
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        })
    }
}




struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

//#Preview {
//    EmojiMemoryGameView()
//}

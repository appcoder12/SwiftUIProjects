//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Prasoon Puri on 09/11/24.
//

import Foundation

struct MemorizeGame <CardContent> {
    //This is access Control (set)
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            cards.append(Card(content: cardContentFactory(pairIndex)))
            cards.append(Card(content: cardContentFactory(pairIndex)))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        //print(cards)
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
    
    
}

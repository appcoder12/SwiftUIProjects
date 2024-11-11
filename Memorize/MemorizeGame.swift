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
        self.cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(content: cardContentFactory(pairIndex)))
            cards.append(Card(content: cardContentFactory(pairIndex)))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
    
    
}

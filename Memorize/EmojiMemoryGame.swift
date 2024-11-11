//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Prasoon Puri on 09/11/24.
//

import SwiftUI

//This is ViewModel Class
class EmojiMemoryGame {
    
    private static let emojis = ["😀", "👻", "🎃", "🤡", "🤖","💩","👽","🤠","💀"]
    
    static func createMemoryGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 4) { index in
            //Cannot use instance member 'emojis' within property initializer; property initializers run before 'self' is available
            //This comes because we are initializing class variable with another class variable becaise Swift initializes them in random manner
            //So how to solve it ? Use "STATIC"
            return emojis[index]
        }
    }
    
    private var model = createMemoryGame() //EmojiMemoryGame.createMemoryGame()
    
    var cards : Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    //This is intent function (Intent to choose the card)
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
}

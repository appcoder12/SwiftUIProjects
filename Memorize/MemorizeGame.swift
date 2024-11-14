//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Prasoon Puri on 09/11/24.
//

import Foundation

struct MemorizeGame <CardContent> where CardContent: Equatable {
    //This is access Control (set)
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            cards.append(Card(content: cardContentFactory(pairIndex), id: "\(pairIndex+1)a"))
            cards.append(Card(content: cardContentFactory(pairIndex), id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheFirstDrawnCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
        }
        
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
            
        }
    }
    
    mutating func choose(_ card: Card) {
//        if let index = index(of: card) {
//            cards[index].isFaceUp.toggle()
//        }
        if let chosenIndex = cards.firstIndex(where: { cardToCheck in
            if cardToCheck.id == card.id {
                print("\(cardToCheck.id)")
                return true
            } else {
                return false
            }
        }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let firstChosenIndex = indexOfTheFirstDrawnCard {
                    //2nd Card is Drawn
                    if cards[firstChosenIndex].content == cards[chosenIndex].content {
                        //Both drawn cards are matched
                        cards[firstChosenIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
//                    indexOfTheFirstDrawnCard = nil
                } else {
                    //Both drawn cards do not match
//                    for index in cards.indices {
//                        cards[index].isFaceUp = false
//                    }
                    indexOfTheFirstDrawnCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
//    func index(of card: Card) -> Int? {
//        for index in cards.indices {
//        //for index in 0..<cards.count {
//            if(cards[index].id == card.id) {
//                return index
//            }
//        }
//        return nil // FIXME: Bogus!
//    }
    
    mutating func shuffle() {
        cards.shuffle()
        //print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String //ObjectIdentifier is a "Don't Care" (Generics) so I changed it to String
        
        static func == (lhs: MemorizeGame<CardContent>.Card, rhs: MemorizeGame<CardContent>.Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched &&
            lhs.content == rhs.content
        }
    }
}

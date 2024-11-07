//
//  ContentView.swift
//  Memorize
//
//  Created by Prasoon Puri on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😀", "👻", "🎃", "🤡", "🤖","💩","👽","🤠","💀"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        return HStack {
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offSet: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offSet
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offSet < 1 || cardCount + offSet > emojis.count)
    }
    
    var cards: some View {
        
    return LazyVGrid(columns: [GridItem(), GridItem()], content: {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fill)
            }
        })
        .foregroundColor(.orange)
    }
    var cardRemover: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    var cardAdder: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
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
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }).onTapGesture {
            isFaceUp.toggle()
        }
    }
}






#Preview {
    ContentView()
}

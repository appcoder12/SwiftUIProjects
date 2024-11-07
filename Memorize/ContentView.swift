//
//  ContentView.swift
//  Memorize
//
//  Created by Prasoon Puri on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😀", "👻", "🎃", "🤡", "🤖","🤡"]
    var body: some View {
        HStack(content: {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        })
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(content: {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                base.strokeBorder(lineWidth: 2)
                    .fill(.white)
                Text(content)
                    .font(.largeTitle)
            } else {
                
                base.strokeBorder(lineWidth: 2)
                    .fill()
                    .foregroundColor(.orange)
            }
        }).onTapGesture {
            isFaceUp.toggle()
        }
    }
}






#Preview {
    ContentView()
}

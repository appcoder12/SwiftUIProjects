//
//  ContentView.swift
//  Memorize
//
//  Created by Prasoon Puri on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            CardView(isFaceUp: true)
        })
    }
}


struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.orange)
                Text("😀")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(lineWidth: 2)
                    .fill()
                    .foregroundColor(.orange)
            }
        })
    }
}






#Preview {
    ContentView()
}

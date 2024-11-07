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
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
        })
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                base.strokeBorder(lineWidth: 2)
                    .fill(.white)
                Text("😀")
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

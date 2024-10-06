//
//  CardView.swift
//  Flashcard
//
//  Created by Andress Vizcaino Seolin on 10/3/24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryCard

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(height: 100)
                    .overlay(Text(card.content).font(.largeTitle))
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(height: 100)
            }
        }
        .shadow(radius: 5)
    }
}


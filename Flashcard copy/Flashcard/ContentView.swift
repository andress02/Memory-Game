//
//  ContentView.swift
//  Flashcard
//
//  Created by Andress Vizcaino Seolin on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards: [MemoryCard] = []  // Memory game cards
    @State private var cardsToPractice: [MemoryCard] = []
    @State private var cardsMemorized: [MemoryCard] = []
    @State private var deckId: Int = 0
    @State private var selectedCardPairs: Int = 6  // Default to 6 pairs of cards
    @State private var showSizeSelectionSheet = false  // Show size selection action sheet

    var body: some View {
        VStack {
            // Button Stack (reset game and choose size)
            HStack {
                Button(action: {
                    resetGame()
                }) {
                    Text("Reset Game")
                        .padding()
                        .background(Color.yellow)  // Yellow reset button
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

                Button(action: {
                    showSizeSelectionSheet.toggle()  // Show the action sheet for choosing card pairs
                }) {
                    Text("Choose Size")
                        .padding()
                        .background(Color.green)  // Green choose size button
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(.bottom, 10)  // Adjust the spacing from the top

            // Card grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 20) {
                ForEach(cards.indices, id: \.self) { index in
                    let card = cards[index]
                    CardView(card: card)
                        .onTapGesture {
                            flipCard(at: index)  // Flip cards when tapped
                        }
                        .opacity(card.isMatched ? 0 : 1)  // Hide matched cards
                }
            }
            .padding()
        }
        .id(deckId)  // Re-render the grid on deck reset
        .onAppear {
            resetGame()  // Initialize the game when the view appears
        }
        .actionSheet(isPresented: $showSizeSelectionSheet) {  // Present the size selection options
            ActionSheet(
                title: Text("Choose Number of Pairs"),
                buttons: [
                    .default(Text("3 Pairs")) {
                        selectedCardPairs = 3
                        resetGame()  // Reset with new size
                    },
                    .default(Text("6 Pairs")) {
                        selectedCardPairs = 6
                        resetGame()  // Reset with new size
                    },
                    .default(Text("10 Pairs")) {
                        selectedCardPairs = 10
                        resetGame()  // Reset with new size
                    },
                    .cancel()
                ]
            )
        }
    }

    // Flip card and match logic
    func flipCard(at index: Int) {
        guard !cards[index].isFaceUp && !cards[index].isMatched else { return }
        
        cards[index].isFaceUp.toggle()
        cardsToPractice.append(cards[index])
        
        if cardsToPractice.count == 2 {
            let firstIndex = cards.firstIndex(of: cardsToPractice[0])!
            let secondIndex = cards.firstIndex(of: cardsToPractice[1])!
            
            if cards[firstIndex].content == cards[secondIndex].content {
                cards[firstIndex].isMatched = true
                cards[secondIndex].isMatched = true
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cards[firstIndex].isFaceUp = false
                    cards[secondIndex].isFaceUp = false
                }
            }
            cardsToPractice.removeAll()
        }
    }

    // Reset and shuffle the game based on the selected card pairs
    func resetGame() {
        let symbols = ["🍎", "🍌", "🍇", "🍉", "🍓", "🍍", "🍑", "🍒", "🍏", "🍋"]
        let pairs = symbols.prefix(selectedCardPairs)
        let pairedCards = pairs.flatMap { symbol in
            [MemoryCard(content: symbol), MemoryCard(content: symbol)]
        }
        cards = pairedCards.shuffled()
        cardsToPractice.removeAll()
        cardsMemorized.removeAll()
        deckId += 1
    }
}

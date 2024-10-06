import SwiftUI

struct CreateFlashcardView: View {
    @Environment(\.dismiss) var dismiss
    @State private var question = ""
    @State private var answer = ""
    
    var onSave: (MemoryCard) -> Void  // Closure to save the new card
    
    var body: some View {
        VStack {
            TextField("Enter Question", text: $question)
                .padding()
            TextField("Enter Answer", text: $answer)
                .padding()
            
            Button("Add Card") {
                let newCard = MemoryCard(content: question)
                onSave(newCard)
                dismiss()  // Dismiss the view
            }
            .padding()
        }
        .padding()
    }
}

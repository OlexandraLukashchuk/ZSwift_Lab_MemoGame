import SwiftUI
import Foundation

struct ContentView: View {
    @StateObject private var viewModel = MemoGameViewModel()
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .foregroundColor(viewModel.currentTheme.color)
            
            cardDisplay
            
            Spacer()
            
            buttonDisplay
        }
        .padding()
        .background(viewModel.currentTheme.backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 85)),
                GridItem(.adaptive(minimum: 85)),
                GridItem(.adaptive(minimum: 85)),
                GridItem(.adaptive(minimum: 85))
            ], spacing: 0) {
                ForEach(viewModel.model.cards) { card in
                    CardView(
                        color: card.isFacedUp ? .white : card.isMatched ? .green : viewModel.currentTheme.color,
                        emoji: card.isFacedUp ? card.content : "🟩",
                        resetCardTrigger: $viewModel.resetCardTrigger,
                        card: card
                    )
                    .padding(5)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
                }
            }
        }
        .padding()
    }
    
    var buttonDisplay: some View {
        HStack(spacing: 40) {
            ForEach([1, 2, 3], id: \.self) { themeNumber in
                Button(action: {
                    viewModel.updateTheme(to: themeNumber)
                }) {
                    Text("Theme \(themeNumber)")
                        .font(.headline)
                        .foregroundColor(viewModel.currentTheme.color)
                        .padding()
                        .background(viewModel.currentTheme.backgroundColor)
                        .cornerRadius(10)
                }
            }
            
            Button(action: {
                viewModel.model.shuffle()
            }) {
                Text("Shuffle Cards")
                    .font(.headline)
                    .foregroundColor(viewModel.currentTheme.color)
                    .padding()
                    .background(viewModel.currentTheme.backgroundColor)
                    .cornerRadius(10)
            }
        }
    }
}

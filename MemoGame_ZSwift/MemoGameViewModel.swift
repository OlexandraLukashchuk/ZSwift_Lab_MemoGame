
import SwiftUI
import Foundation

class MemoGameViewModel: ObservableObject {
    // Definicja tablic emoji
    private static let tab1 = ["🍎", "🍌", "🍒", "🍉", "🍍", "🍓", "🍇", "🍊"]
    private static let tab2 = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    private static let tab3 = ["⚽", "🏀", "🏈", "🎾", "🏓", "🏒", "🎱", "🏆"]
    
    @Published var resetCardTrigger = 0
    @Published var currentTheme: Theme = Theme(id: 1, color: .blue, backgroundColor: .white)
    
    private static var currentCards = tab1
    
    @Published var model: MemoGameModel<String> = createMemoGame()

    
    private static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfCards: currentCards.count) { index in
            if (currentCards.indices.contains(index)) {
                return currentCards[index]
            } else {
                return "??"
            }
        }
    }
    
    
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    public func updateTheme(to number: Int) {
        switch number {
        case 1:
            MemoGameViewModel.currentCards = MemoGameViewModel.tab1
            currentTheme = Theme(id: 1, color: .blue, backgroundColor: .white)
        case 2:
            MemoGameViewModel.currentCards = MemoGameViewModel.tab2
            currentTheme = Theme(id: 2, color: .green, backgroundColor: .blue)
        case 3:
            MemoGameViewModel.currentCards = MemoGameViewModel.tab3
            currentTheme = Theme(id: 3, color: .red, backgroundColor: .yellow)
        default:
            break
        }
        model = MemoGameViewModel.createMemoGame()
    }
    
    struct Theme {
        var id: Int
        var color: Color
        var backgroundColor: Color
    }
}


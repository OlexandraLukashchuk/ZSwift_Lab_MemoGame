import SwiftUI

struct CardView: View {
    var color: Color
    var emoji: String
    var resetCardTrigger: Binding<Int>
    var card: MemoGameModel<String>.Card
    
    @State private var rotationAngle: Double = 0

    var cardContent: MemoGameModel<String>.Card {
        card
    }
    
    var body: some View {
        CirclePart(endAngel: .degrees(270))
            .overlay(Text(card.content))
            .padding()
            .modifier(TransformIntoCard(isFaceUp: card.isFacedUp))
            
            .rotationEffect(.degrees(rotationAngle))
            .onChange(of: card.isMatched) { matched in
                if matched {
                    withAnimation(Animation.linear(duration: 2).repeatCount(1, autoreverses: false)) {
                        rotationAngle += 360
                    }
                }
            }
    }
}

    


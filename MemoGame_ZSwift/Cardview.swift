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
            .overlay(Text(card.content).font(.system(size: Constrants.FontSize.large))
                     .minimumScaleFactor()
                     .multilineTextAligment(.center)
                     .padding(Constrants.inserts)
                     
                     .rotationEffect(.degrees(card.isMatched? 360:0))
                     .animation(.spin(duration:2, value: isMatched ? 0:1))
                     
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

    


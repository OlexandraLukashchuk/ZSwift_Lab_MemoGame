import SwiftUI

struct CardView: View {
    var color: Color
    var emoji: String
    var resetCardTrigger: Binding<Int>
    var card: MemoGameModel<String>.Card
    
    
    var cardContent: MemoGameModel<String>.Card {
        card
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 85, height: 85)
            
            
            Text(emoji)
                .font(.system(size: 200))
                .minimumScaleFactor(0.01)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}

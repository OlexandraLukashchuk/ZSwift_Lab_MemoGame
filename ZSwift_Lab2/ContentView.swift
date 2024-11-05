import SwiftUI

struct ContentView: View {
    
    let items = ["😀", "🐼", "🐨", "🦊"]
  @State private var displayedCards: Int = 4
    
    var body: some View {
        VStack {
            cardDisplay
            HStack {
                decreaseCardsButton
                increaseCardsButton
            }
        }
    }
    var cardDisplay: some View {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 120))],
                    spacing: 5
                ) {
                    ForEach(0..<displayedCards, id: \.self) { index in
                        CardView(content: items[index])
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
        }
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            displayedCards += offset
        }) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 2))
        }
     
        .disabled((displayedCards + offset < 2) || (displayedCards + offset > items.count))
    }
    
    var increaseCardsButton: some View {
        adjustCardNumber(by: 2, symbol: "plus")
    }
  
    var decreaseCardsButton: some View {
        adjustCardNumber(by: -2, symbol: "minus")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

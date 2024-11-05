import SwiftUI

struct CardView: View {
  
    @State private var isFlipped: Bool = false
    var content: String
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
                    .background(isFlipped ? Color.white : Color.blue)
                    .cornerRadius(12)
                
                if isFlipped {
                    Text(content)
                        .font(.largeTitle)
                } else {
                    Text("")
                }
            }
            .frame(width: 120, height: 50)
            .onTapGesture(count: 1) {
                withAnimation {
                    isFlipped.toggle()
                }
            }
        }
        .opacity(isFlipped ? 1 : 0.5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
}

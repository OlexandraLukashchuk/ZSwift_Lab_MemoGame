//
//  ViewModifier.swift
//  MemoGame_ZSwift
//
//  Created by student on 03/12/2024.
//
import Foundation
import SwiftUI

struct TransformIntoCard: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View{
        
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            base.strokeBorder(lineWidth: 2)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1:0 )
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0:180), axis: (0,1,0))
        .animation(.easeInOut(duration: 1), value: isFaceUp)
        
    }
    
    
}

#Preview {
    //TransformIntoCard()
}

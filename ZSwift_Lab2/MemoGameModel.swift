//
//  MemoGameModel.swift
//  ZSwift_Lab2
//
//  Created by student on 5/11/24.
//

import Foundation



struct MemoGameModel <CardContent: Equatable>{
    private var arrayOfcards:  [Card]
    private var currentCard: Card? = nil
    init(numberOfCards: Int, cardContentFactory: (Int)-> CardContent){
        let index = Int.random(in: 0...numberOfCards)
        
        for i in 0..<numberOfCards {
            self.arrayOfcards.append(Card(id: "\(i)", content: cardContentFactory(i)))
            if (i == index) {
                self.currentCard = Card(id: "\(i)", content: cardContentFactory(i))
            }
        }
        
    }
    
    public mutating func shuffleCards(){
        self.arrayOfcards.shuffle()
    }
    
    
    
   
    struct Card: Identifiable, Equatable {
       let id: String
       var isFaceUp: Bool = true
       var isMatched: Bool = false
       var content: CardContent
   }

    
}

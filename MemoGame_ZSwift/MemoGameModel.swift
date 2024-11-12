//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation
struct MemoGameModel<CardContent> where CardContent : Equatable{
    public var cards: Array<Card>
    public  var mainCard: Int
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        mainCard = 0
        for i in 0..<max(2,numberOfCards){
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: "\(i)a"))
            cards.append(Card(content: content, id: "\(i)b"))
        }
    }
    mutating func choose(_ card: Card){
        if let i = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[i].isFacedUp && !cards[i].isMatched{
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[i].content == cards[potentialMatchedIndex].content{
                        cards[i].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                        mainCard = mainCard + 4
                    }
                    if cards[i].hasBeenSeen{
                        mainCard = mainCard - 1
                    }
                    if cards[potentialMatchedIndex].hasBeenSeen{
                        mainCard = mainCard - 1
                    }
                }else{
                    indexOfOneAndOnlyFaceUpCard = i

                }
                cards[i].isFacedUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get {
            cards.indices.filter{index in cards[index].isFacedUp}.only
        }
        set {
            cards.indices.forEach{cards[$0].isFacedUp = (newValue == $0)}
        }
    }
    
    struct Card : Equatable, Identifiable{
        var isFacedUp = false {
         didSet {
             if oldValue && !isFacedUp {
                 hasBeenSeen = true
                }
            }
         }
        var isMatched : Bool = false
        var content : CardContent
        var id : String
        var hasBeenSeen : Bool = false
    }

}
extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}

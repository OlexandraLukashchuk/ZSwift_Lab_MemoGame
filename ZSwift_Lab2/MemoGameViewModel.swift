//
//  MemoGameViewModel.swift
//  ZSwift_Lab2
//
//  Created by student on 5/11/24.
//

import SwiftUI

class MemoGameViewModel: ObservableObject{
    var displayedCards: [String] = []
    private let theme1Symbols = ["🍎", "🍌", "🍒", "🍉", "🍍", "🍓", "🍇", "🍊"]
    private let theme2Symbols = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    private let theme3Symbols = ["⚽", "🏀", "🏈", "🎾", "🏓", "🏒", "🎱", "🏆"]
    private var selectedTheme: [String] = []
    private(set) var model: MemoGameModel<String>?
    
    
}

#Preview {
    MemoGameViewModel()
}

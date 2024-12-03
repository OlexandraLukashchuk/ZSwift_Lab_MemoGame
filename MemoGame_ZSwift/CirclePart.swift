//
//  CirclePart.swift
//  MemoGame_ZSwift
//
//  Created by student on 03/12/2024.
//

import Foundation
import SwiftUI
import CoreGraphics



struct CirclePart: Shape{
     var startAngel: Angle = .zero
     var endAngel: Angle
    let clockwise = true
    
    
    func path(in ract: CGRect)->Path{
        let center = CGPoint(x: ract.midX, y: ract.midY)
        let radius = min(ract.width, ract.height)/2
        let start = CGPoint(x: center.x + radius*cos(startAngel.radians),
                            y: center.y+radius*sin(startAngel.radians))
      
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngel, endAngle: endAngel, clockwise: !clockwise)
        
        return p
        
    }
}

#Preview{
    CirclePart(endAngel: .degrees(270))
}

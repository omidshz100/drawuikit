//
//  Drawing.swift
//  CoreGraphicSample
//
//  Created by Omid Shojaeian Zanjani on 05/07/23.
//

import SwiftUI

struct Drawing: View {
    var body: some View {
        Path { p in
                       p.addArc(center: CGPoint(x: 100.00, y: 100.00),
                                        radius: 60.00,
                                        startAngle: Angle(degrees: 0.00),
                                        endAngle: Angle(degrees: 163.11),
                                        clockwise: false,
                                        transform: CGAffineTransform(scaleX: 1.00, y: 1.00))
                   }
                   .fill(Color.blue)
                   .frame(width:200, height: 200)
                   .border(Color.gray)
    }
}

struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        Drawing()
    }
}

//
//  RectShape.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct RectShape: Shape {
    func path(in rect: CGRect) -> Path {
        .init { path in
            let point1: CGPoint = .init(x: rect.width, y: rect.height)
            let point2: CGPoint = .init(x: rect.width, y: 0)
            let point3: CGPoint = .init(x: 0, y: 0)
            let point4: CGPoint = .init(x: 0, y: rect.height)
            path.move(to: point1)
            path.addArc(tangent1End: point1, tangent2End: point2, radius: 0)
            path.addArc(tangent1End: point2, tangent2End: point3, radius: 4)
            path.addArc(tangent1End: point3, tangent2End: point4, radius: 4)
            path.addArc(tangent1End: point4, tangent2End: point1, radius: 0)
        }
    }
}

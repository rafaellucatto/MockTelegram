//
//  RightBubbleShape.swift
//  MockTelegram
//
//  Created by someone else on 4/10/23.
//

import Foundation
import SwiftUI

struct RightBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        return .init { path in
            let width: CGFloat = rect.width
            let height: CGFloat = rect.height
            path.move(to: CGPoint(x: 25, y: height))
            path.addLine(to: CGPoint(x:  20, y: height))
            path.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            path.addLine(to: CGPoint(x: 0, y: 20))
            path.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            path.addLine(to: CGPoint(x: width - 21, y: 0))
            path.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            path.addLine(to: CGPoint(x: width - 4, y: height - 11))
            path.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            path.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            path.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
        }
    }
}

//
//  LetterModifier.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/5/23.
//

import Foundation
import SwiftUI

struct LetterModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .modifier(NameBGColorModifier(mainColor: colors[Int.random(in: 0..<colors.count)]))
    }
}

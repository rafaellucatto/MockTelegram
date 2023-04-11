//
//  NameBGColorModifier.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/5/23.
//

import SwiftUI

struct NameBGColorModifier: ViewModifier {

    var mainColor: Color

    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    mainColor
                    LinearGradient(colors: [.init(CGColor(red: 1, green: 1, blue: 1, alpha: 0.6)),
                                            .init(CGColor(red: 1, green: 1, blue: 1, alpha: 0))],
                                   startPoint: .top,
                                   endPoint: .bottom)
                }
            )
            .clipShape(Circle())
    }
}

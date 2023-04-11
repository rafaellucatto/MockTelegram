//
//  ChatBaloon.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct ChatBaloon: View {

    var message: String
    var isFromSelf: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            if isFromSelf {
                Color.blue.clipShape(RightBubbleShape())
            } else {
                Color(uiColor: .init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)).clipShape(LeftBubbleShape())
            }
            Text(message)
                .font(.system(size: 15))
                .lineLimit(nil)
                .padding([.leading, .trailing], 4)
                .padding([.top, .bottom], 2)
                .foregroundColor(isFromSelf ? .white : .black)
                .padding(.leading, 4)
        }
        .frame(width: UIScreen.main.bounds.width * 0.7)
    }
}


struct ChatBaloon_Previews: PreviewProvider {
    static var previews: some View {
        ChatBaloon(message: "Just a test", isFromSelf: true)
    }
}

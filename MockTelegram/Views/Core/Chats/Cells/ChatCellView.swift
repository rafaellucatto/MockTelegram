//
//  ChatCellView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/3/23.
//

import SwiftUI

struct ChatCellView: View {

    var contactNameColor: Color
    var contactName: String
    var lastMessage: String
    var lastMessageDate: String
    var contactNameLetter: String { "\(contactName.first?.description ?? "")" }

    var body: some View {
        HStack {
            Text(contactNameLetter)
                .font(.system(size: 26, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .modifier(NameBGColorModifier(mainColor: contactNameColor))
            VStack(spacing: 0) {
                HStack {
                    Text(contactName)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(lastMessageDate)
                        .font(.system(size: 16, weight: .light))
                        .frame(width: UIScreen.main.bounds.width * 0.1)
                }
                .padding(.top, 5)
                Text(lastMessage)
                    .font(.system(size: 16, weight: .light))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                Spacer()
            }
            Spacer()
        }
    }

}

struct ChatCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatCellView(contactNameColor: .blue, contactName: "John", lastMessage: "Sup", lastMessageDate: "12/12")
    }
}

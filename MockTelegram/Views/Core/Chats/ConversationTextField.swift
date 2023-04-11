//
//  ConversationTextField.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct ConversationTextField: View {

    @Binding var messageToBeSent: String

    var body: some View {
        ZStack {
            Color.clear.background(.ultraThickMaterial).edgesIgnoringSafeArea(.bottom)
            HStack {
                Image(systemName: "paperclip")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Layout.imageSize, height: Layout.imageSize)
                    .foregroundColor(.black)
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading)
                ZStack {
                    Color.white
                        .cornerRadius(16)
                    HStack(spacing: 0) {
                        TextField("Message_", text: $messageToBeSent, prompt: Text("Message"))
                            .background(Color.clear)
                            .padding([.leading, .trailing])
                        Layout.circleImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Layout.textFieldImageHeight, height: Layout.textFieldImageHeight)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    }
                }
                .frame(height: Layout.textFieldHeight)
                Image(systemName: "mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Layout.imageSize, height: Layout.imageSize)
                    .foregroundColor(.black)
                    .padding(.trailing)
            }
            .frame(maxWidth: .infinity)
        }
    }

    enum Layout {
        static let textFieldHeight: CGFloat = 35
        static let imageSize: CGFloat = 25
        static let textFieldImageHeight: CGFloat = 20
        static let textFieldAreaHeight: CGFloat = 45
        static let circleImage: Image = .init(systemName: "wake.circle")
    }
}

struct ConversationTextField_Previews: PreviewProvider {
    static var previews: some View {
        ConversationTextField(messageToBeSent: .constant("Message goes here"))
    }
}

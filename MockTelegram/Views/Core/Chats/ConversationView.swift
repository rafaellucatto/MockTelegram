//
//  ConversationView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/6/23.
//

import SwiftUI

var messages: [Message] {
    var messages: [Message] = []
    let msg1: Message = .init(origin: .contact, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    let msg2: Message = .init(origin: .myself, message: "Praesent aliquam justo magna, id consequat nibh efficitur et. Phasellus tempor purus ligula, pretium placerat lectus tincidunt id.")
    let msg3: Message = .init(origin: .contact, message: "Proin imperdiet, ante et mattis dignissim, libero quam tristique nibh, quis viverra ante enim in nisi. Aliquam volutpat turpis enim, a pretium turpis tincidunt faucibus.")
    for _ in 0..<4 {
        messages.append(msg1)
        messages.append(msg2)
        messages.append(msg3)
    }
    return messages
}

struct Message {
    
    enum MessageOrigin {
        case myself
        case contact
    }

    let origin: MessageOrigin
    let message: String
}

struct ConversationView: View {

    var contactName: String
    var contactImage: AnyView
    var contactColor: Color

    @State var hasAppeared: Bool = false
    @State var messageToBeSent: String = ""
    @State var isSavedMessageChat: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                List {
                    ForEach(0..<messages.count, id: \.self) { num in
                        HStack(spacing: 0) {
                            if messages[num].origin == .myself {
                                Spacer()
                                ChatBaloon(message: messages[num].message, isFromSelf: true)
//                                    .id(num) // add this afterwards
                            } else {
                                ChatBaloon(message: messages[num].message, isFromSelf: false)
//                                    .id(num) // add this afterwards
                                Spacer()
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                    Text("").frame(width: 0, height: 0).background(Color.teal).id("this is a test")
                }
                .onAppear {
                    proxy.scrollTo("this is a test", anchor: UnitPoint.bottom)
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            ConversationTextField(messageToBeSent: $messageToBeSent)
                .frame(height: ConversationTextField.Layout.textFieldAreaHeight)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if isSavedMessageChat {
                    Button {
                        print("magnifyingglass did get clicked")
                        // handle action
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                } else {
                    NavigationLink {
                        ContactProfileFromConversation(contactName: contactName, contactColor: contactColor)
                    } label: {
                        contactImage
                    }
                }
            }
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(contactName)
                        .bold()
                    Text("last seen yesterday")
                        .font(.system(size: 12))
                        .foregroundColor(.init(uiColor: .systemGray))
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(contactName: "Test", contactImage: AnyView(Text("ImageViewTest")), contactColor: .orange)
    }
}

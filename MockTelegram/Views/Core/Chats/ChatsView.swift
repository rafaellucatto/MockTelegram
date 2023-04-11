//
//  ChatsView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/3/23.
//

import SwiftUI

let colors: [Color] = [.blue, .red, .yellow, .orange, .green, .purple, .indigo, .cyan, .mint, .teal]

struct ChatsView: View {

    @State private var chatSearch: String = ""

    let names: [String] = ["James", "John", "Oliver", "Nick", "Adam", "Emma", "Isabella", "Camila", "Sarah", "Ashley"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<12, id: \.self) { num in
                    ZStack {
                        let contactName: String = names[Int.random(in: 0..<names.count)]
                        let contactColor: Color = colors[Int.random(in: 0..<colors.count)]
                        let contactNameLetter: String = "\(contactName.first?.description ?? "")"
                        let contactImageView = Text(contactNameLetter)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                            .modifier(NameBGColorModifier(mainColor: contactColor))
                        NavigationLink {
                            ConversationView(contactName: contactName, contactImage: AnyView(contactImageView), contactColor: contactColor)
                        } label: {
                            EmptyView()
                        }
                        .opacity(0)
                        ChatCellView(contactNameColor: contactColor,
                                     contactName: contactName,
                                     lastMessage: "Man, programming is awesome! Doesn't matter what language it is",
                                     lastMessageDate: "Thu")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("edit did get clicked")
                        // handle action
                    } label: {
                        Text("Edit")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("square and pencil did get clicked")
                        // handle action
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
        .searchable(text: $chatSearch, prompt: "Search chats")
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}

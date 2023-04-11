//
//  SettingsSection.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

enum SettingsSection: CaseIterable {
    case message
    case general
    case premium
    case question

    var getButtons: [SettingsButton] {
        switch self {
        case .message:
            return [.init(imageName: "rectangle.stack.badge.person.crop.fill",
                          buttonName: "Saved Messages",
                          backgroundColor: .indigo,
                          nextView: AnyView(Text("Hello from view 1"))),
                    .init(imageName: "phone.fill",
                          buttonName: "Recent Calls",
                          backgroundColor: .green,
                          nextView: AnyView(Text("Hello from view 2"))),
                    .init(imageName: "laptopcomputer.and.iphone",
                          buttonName: "Devices",
                          backgroundColor: .orange,
                          nextView: AnyView(Text("Hello from view 3"))),
                    .init(imageName: "folder.fill",
                          buttonName: "Chat Folders",
                          backgroundColor: .blue,
                          nextView: AnyView(Text("Hello from view 4")))]
        case .general:
            return [.init(imageName: "bell.badge",
                          buttonName: "Notification and Sounds",
                          backgroundColor: .red,
                          nextView: AnyView(Text("Hello from view 5"))),
                    .init(imageName: "lock.fill",
                          buttonName: "Privacy and Security",
                          backgroundColor: .gray,
                          nextView: AnyView(Text("Hello from view 6"))),
                    .init(imageName: "tray.full.fill",
                          buttonName: "Data and Storage",
                          backgroundColor: .green,
                          nextView: AnyView(Text("Hello from view 7"))),
                    .init(imageName: "circle.lefthalf.filled",
                          buttonName: "Appearance",
                          backgroundColor: .blue,
                          nextView: AnyView(Text("Hello from view 8"))),
                    .init(imageName: "globe",
                          buttonName: "Language",
                          backgroundColor: .purple,
                          nextView: AnyView(Text("Hello from view 9"))),
                    .init(imageName: "sleep.circle.fill",
                          buttonName: "Sticker and Emoji",
                          backgroundColor: .orange,
                          nextView: AnyView(Text("Hello from view 10")))]
        case .premium:
            return [.init(imageName: "star.fill",
                          buttonName: "Telegram Premium",
                          backgroundColor: .purple,
                          nextView: AnyView(Text("Hello from view 11")))]
        case .question:
            return [.init(imageName: "ellipsis.bubble.fill",
                          buttonName: "Ask a Question",
                          backgroundColor: .orange,
                          nextView: AnyView(Text("Hello from view 12"))),
                    .init(imageName: "questionmark.circle.fill",
                          buttonName: "Telegram FAQ",
                          backgroundColor: .blue,
                          nextView: AnyView(Text("Hello from view 13"))),
                    .init(imageName: "lightbulb.fill",
                          buttonName: "Telegram Features",
                          backgroundColor: .yellow,
                          nextView: AnyView(Text("Hello from view 14")))]
        }
    }
}

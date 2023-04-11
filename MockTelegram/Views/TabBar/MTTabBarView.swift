//
//  MTTabBarView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/3/23.
//

import SwiftUI

struct MTTabBarView: View {

    private enum MTTab: Int {
        case contacts = 0
        case chats = 1
        case settings = 2
        
        var getTabItem: some View {
            switch self {
            case .contacts:
                return VStack {
                    Image(systemName: "person.circle")
                    Text("Contacts")
                }
            case .chats:
                return VStack {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("Chats")
                }
            case .settings:
                return VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }
    }

    private enum K {
        static let tabSelection: String = "tabSelection"
    }

    @AppStorage(K.tabSelection) private var selectedTabBar: Int = MTTab.contacts.rawValue

    var body: some View {
        TabView(selection: $selectedTabBar) {
            ContactsView()
                .tabItem {
                    MTTab.contacts.getTabItem
                }
                .tag(MTTab.contacts.rawValue)
                .onAppear {
                    selectedTabBar = MTTab.contacts.rawValue
                }
            ChatsView()
                .tabItem {
                    MTTab.chats.getTabItem
                }
                .tag(MTTab.chats.rawValue)
                .onAppear {
                    selectedTabBar = MTTab.chats.rawValue
                }
            SettingsView()
                .tabItem {
                    MTTab.settings.getTabItem
                }
                .tag(MTTab.settings.rawValue)
                .onAppear {
                    selectedTabBar = MTTab.settings.rawValue
                }
        }
    }
}

struct MTTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MTTabBarView()
    }
}

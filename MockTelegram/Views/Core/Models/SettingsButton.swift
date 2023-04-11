//
//  SettingsButton.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct SettingsButton: Identifiable {
    let id: UUID = .init()
    let imageName: String
    let buttonName: String
    let backgroundColor: Color
    let nextView: AnyView
}

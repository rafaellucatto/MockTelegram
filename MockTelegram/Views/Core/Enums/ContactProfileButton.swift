//
//  ContactProfileButton.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

enum ContactProfileButton: String, CaseIterable {
    case phone = "phone.fill"
    case video = "video.fill"
    case bell = "bell.fill"
    case search = "magnifyingglass"
    case etc = "ellipsis"

    var getImage: Image {
        return Image(systemName: self.rawValue)
    }

    var getButtonName: String {
        switch self {
        case .phone:
            return "call"
        case .video:
            return "video"
        case .bell:
            return "mute"
        case .search:
            return "search"
        case .etc:
            return "more"
        }
    }
}

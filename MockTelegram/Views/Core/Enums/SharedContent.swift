//
//  SharedContent.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import Foundation

enum SharedContent: String, CaseIterable {
    case media = "Media"
    case files = "Files"
    case voice = "Voice"
    case links = "Links"
    case gifs = "GIFs"
}

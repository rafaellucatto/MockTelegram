//
//  ShowChosenSharedContent.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct ShowChosenSharedContent: View {

    enum ImageLayout {
        static let side: CGFloat = UIScreen.main.bounds.width * 0.33
        static let padding: CGFloat = 3
    }

    let chosenSharedContent: SharedContent

    var body: some View {
        VStack(spacing: 0) {
            switch chosenSharedContent {
            case .media:
                MediaView()
            case .files:
                FileView()
            case .voice:
                Text("voice")
            case .links:
                Text("links")
            case .gifs:
                Text("gifs")
            }
        }
    }
}

struct ShowChosenSharedContent_Previews: PreviewProvider {
    static var previews: some View {
        ShowChosenSharedContent(chosenSharedContent: .media)
    }
}

//
//  MediaView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct MediaView: View {

    var items: [String] {
        var items: [String] = []
        for n in 0...50 {
            items.append("Picture \(n + 1)")
        }
        return items
    }
    var gridItem: [GridItem] {
        var grid: [GridItem] = []
        for _ in 0..<3 {
            grid.append(.init(.fixed(ShowChosenSharedContent.ImageLayout.side), spacing: ShowChosenSharedContent.ImageLayout.padding, alignment: .center))
        }
        return grid
    }

    var body: some View {
        LazyVGrid(columns: gridItem, spacing: ShowChosenSharedContent.ImageLayout.padding) {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .frame(maxWidth: .infinity)
                    .frame(height: ShowChosenSharedContent.ImageLayout.side)
                    .background(Color.green)
            }
        }
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView()
    }
}

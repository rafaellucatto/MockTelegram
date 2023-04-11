//
//  SettingsCellView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/4/23.
//

import SwiftUI

struct SettingsCellView: View {

    var imageBGColor: Color
    var hasImageBGColor: Bool { return imageBGColor != .clear }
    var imageSystemName: String
    var buttonText: String

    var body: some View {
        HStack {
            if hasImageBGColor {
                ZStack {
                    imageBGColor
                        .frame(width: 32, height: 32)
                        .cornerRadius(6)
                    Image(systemName: imageSystemName)
                        .foregroundColor(.white)
                }
            } else {
                Image(systemName: imageSystemName)
                    .font(.system(size: 22, weight: .light))
            }
            Text(buttonText)
        }
    }
}

struct SettingsCellView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCellView(imageBGColor: .green, imageSystemName: "phone", buttonText: "Recent Calls")
    }
}

//
//  SharedContentButtons.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct SharedContentButtons: View {

    @Binding var chosenSharedContent: SharedContent
    @Namespace var tabRectangle

    private enum K: String {
        case rectangleId = "tabRectangleId"
    }

    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(SharedContent.allCases, id: \.self) { sharedContent in
                let isChosen: Bool = sharedContent.rawValue == chosenSharedContent.rawValue
                Button {
                    withAnimation {
                        chosenSharedContent = sharedContent
                    }
                } label: {
                    ZStack {
                        Text(sharedContent.rawValue)
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(isChosen ? .blue : .init(uiColor: .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
                            .padding(.bottom, 3)
                        if chosenSharedContent == sharedContent {
                            VStack(spacing: 0) {
                                Spacer()
                                Rectangle()
                                    .frame(width: 30, height: 5)
                                    .clipShape(RectShape())
                                    .matchedGeometryEffect(id: K.rectangleId.rawValue, in: tabRectangle, isSource: true)
                            }
                        }
                    }
                    .frame(height: 40)
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, 10)
        .background(Color.white)
    }
}

struct SharedContentButtons_Previews: PreviewProvider {
    static var previews: some View {
        SharedContentButtons(chosenSharedContent: .constant(.media))
    }
}

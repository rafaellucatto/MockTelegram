//
//  ContactProfileFromConversation.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/29/23.
//

import SwiftUI

struct ContactProfileFromConversation: View {

    let contactName: String
    let contactColor: Color

    @State var chosenSharedContent: SharedContent = .media

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    ContactProfileHeader(contactName: contactName, contactColor: contactColor)
                    ButtonStack()
                    ContactPhone()
                    SharedContentButtons(chosenSharedContent: $chosenSharedContent)
                    ShowChosenSharedContent(chosenSharedContent: chosenSharedContent)
                        .background(Color.white)
                }
            }
            .background(Color(uiColor: .init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // handle action
                } label: {
                    Text("Edit")
                }
            }
        }
    }
}

struct ContactProfileHeader: View {

    let contactName: String
    let contactColor: Color

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    let contactLetter: String = "\(contactName.first?.description ?? "")"
                    Text(contactLetter)
                        .font(.system(size: 45, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .modifier(NameBGColorModifier(mainColor: contactColor))
                    Text(contactName)
                        .bold()
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                    Text("last seen yesterday")
                        .font(.system(size: 16))
                        .foregroundColor(.init(uiColor: .systemGray))
                }
                Spacer()
            }
        }
        .padding(.bottom, 10)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct ContactProfileFromConversation_Previews: PreviewProvider {
    static var previews: some View {
        ContactProfileFromConversation(contactName: "John", contactColor: .orange)
    }
}

struct ButtonStack: View {

    var body: some View {
        HStack {
            ForEach(ContactProfileButton.allCases, id: \.self) { butn in
                Button {
                    print("button \(butn.getButtonName) got pressed")
                } label: {
                    VStack {
                        butn.getImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Text(butn.getButtonName)
                            .font(.system(size: 12))
                    }
                    .frame(width: ButtonLayout.width, height: ButtonLayout.width, alignment: .center)
                    .background(Color.white.cornerRadius(8))
                }
                .buttonStyle(BorderlessButtonStyle()) // this line of code is needed for the buttons to behave properly
                if butn.getButtonName != "more" {
                    Spacer()
                }
            }
        }
        .background(Color.clear)
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity)
        .padding([.horizontal, .bottom], 10)
    }
}



enum ButtonLayout {
    static let width: CGFloat = UIScreen.main.bounds.width * 0.162
}

struct FileView: View {
    var body: some View {
        LazyVGrid(columns: [.init(.fixed(UIScreen.main.bounds.width))], alignment: .leading) {
            ForEach(0..<10, id: \.self) { num in
                HStack {
                    Text("Pic")
                        .frame(width: 50, height: 50)
                        .background(Color.teal)
                        .cornerRadius(6)
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("ScreenShot yyyy-mm-dd.png")
                            .font(.system(size: 14))
                            .bold()
                        Text("183.9 KB - MMM dd, yyyy at 11:23")
                            .font(.system(size: 12))
                            .foregroundColor(.init(uiColor: .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
                        Spacer()
                        Divider()
                    }
                }
                .padding(.leading, 4)
                .frame(height: 60)
            }
        }
    }
}

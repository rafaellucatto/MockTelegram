//
//  SettingsFirstView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/5/23.
//

import SwiftUI

struct SettingsFirstView: View {

    var body: some View {
        List {
            Section {
                Button {
                    print("photocamera did get clicked")
                    // handle action
                } label: {
                    SettingsCellView(imageBGColor: .clear, imageSystemName: "camera", buttonText: "Set Profile Photo")
                }
            } header: {
                Button {
                    print("profile photo did get clicked")
                    // handle action
                } label: {
                    VStack {
                        ListCentralizedView(view: AnyView(
                            Text("J")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 100, height: 100)
                                .modifier(NameBGColorModifier(mainColor: .orange))
                        ))
                        ListCentralizedView(view: AnyView(
                            Text("John")
                                .font(.system(size: 22, weight: .medium, design: .default))
                                .textCase(nil)
                                .foregroundColor(.black)
                        ))
                        ListCentralizedView(view: AnyView(
                            Text("+55 21 912341234 - @yourUser")
                                .textCase(nil)
                                .foregroundColor(.black)
                                .padding(.bottom, 10)
                        ))
                    }
                }
            }
            ForEach(SettingsSection.allCases, id: \.self) { section in
                Section {
                    ForEach(section.getButtons) { button in
                        NavigationLink {
                            button.nextView
                        } label: {
                            SettingsCellView(imageBGColor: button.backgroundColor, imageSystemName: button.imageName, buttonText: button.buttonName)
                        }
                    }
                }
            }
        }
    }
}

struct SettingsFirstView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFirstView()
    }
}

struct ListCentralizedView: View {

    var view: AnyView

    var body: some View {
        HStack {
            Spacer()
            view
            Spacer()
        }
    }
}

//
//  ProfileEditingSettingsView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/4/23.
//

import SwiftUI

struct ProfileEditingSettingsView: View {

    @State var userName: String = "John"
    @State var userSurname: String = "J Jameson"
    @State var bio: String = ""

    var body: some View {
        Form {
            Section {
                TextField("Name here", text: $userName)
                TextField("Surname here", text: $userSurname)
            } header: {
                ListCentralizedView(view: AnyView(
                    Button(action: {
                        // handle action
                    }, label: {
                        VStack {
                            ZStack {
                                Color.white.clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .frame(width: 40, height: 30)
                                    .background(Color.clear)
                            }
                            Text("Set New Photo")
                                .textCase(nil)
                                .padding([.top, .bottom], 8)
                        }
                    })
                ))
            } footer: {
                Text("Enter your name and add an optional profile photo.")
                    .textCase(nil)
            }
            Section {
                TextField("Bio", text: $bio)
            } footer: {
                Text("Any details such as age, occupation or city. Example: 23 y.o. designer from San Francisco.")
                    .textCase(nil)
            }
            Section {
                NavigationLink {
                    Text("Hello from NumberChangingView")
                } label: {
                    HStack {
                        Text("Change Number")
                        Spacer()
                        Text("+55 21 912341234")
                            .foregroundColor(.init(uiColor: .secondaryLabel))
                    }
                }
                NavigationLink {
                    Text("Hello from UsernameChangingView")
                } label: {
                    HStack {
                        Text("Username")
                        Spacer()
                        Text("@yourUser")
                            .foregroundColor(.init(uiColor: .secondaryLabel))
                    }
                }
            }
            Section {
                ListCentralizedView(view: AnyView(
                    Button(action: {
                        // handle action
                    }, label: {
                        Text("Add Another Account")
                    })
                ))
            } footer: {
                Text("You can connect multiple accounts with different phone numbers.")
                    .textCase(nil)
            }
            Section {
                ListCentralizedView(view: AnyView(
                    Button(action: {
                        // handle action
                    }, label: {
                        Text("Log Out")
                            .foregroundColor(.red)
                    })
                ))
            }
            Color.clear.frame(height: 200).listRowBackground(Color.clear)
        }
    }
}

struct ProfileEditingSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingSettingsView()
    }
}

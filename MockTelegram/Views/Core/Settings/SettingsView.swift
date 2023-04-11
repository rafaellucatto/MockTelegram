//
//  SettingsView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/3/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isEditingViewBeingShown: Bool = false
    
    let userName: String = "John"
    
    var body: some View {
        NavigationStack {
            if isEditingViewBeingShown {
                ProfileEditingSettingsView()
                    .navigationTitle(userName)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                withAnimation {
                                    isEditingViewBeingShown.toggle()
                                }
                            } label: {
                                Text("Cancel")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                withAnimation {
                                    isEditingViewBeingShown.toggle()
                                }
                            } label: {
                                Text("Done")
                            }
                        }
                    }
            } else {
                SettingsFirstView()
                    .navigationTitle(userName)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                withAnimation {
                                    isEditingViewBeingShown.toggle()
                                }
                            } label: {
                                Image(systemName: "qrcode")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                withAnimation {
                                    isEditingViewBeingShown.toggle()
                                }
                            } label: {                                    
                                Text("Edit")
                            }
                        }
                    }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

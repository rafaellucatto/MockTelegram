//
//  ContactPhone.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 4/3/23.
//

import SwiftUI

struct ContactPhone: View {
    var body: some View {
        VStack {
            Text("mobile")
                .font(.system(size: 16))
                .padding(.bottom, 0.4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 5)
            Button {
                // handle action
            } label: {
                Text("+55 11 912341234")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom, 5)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .background(Color.white.cornerRadius(8).edgesIgnoringSafeArea(.horizontal))
        .padding([.horizontal, .bottom], 10)
    }
}

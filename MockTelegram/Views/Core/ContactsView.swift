//
//  ContactsView.swift
//  MockTelegram
//
//  Created by Rafael Lucatto on 3/3/23.
//

import SwiftUI

struct ContactDetails: View {

    var repeating: Int
    var letter: String

    var body: some View {
        Section {
            ForEach(0..<repeating, id: \.self) { _ in
                HStack {
                    Text(letter)
                        .modifier(LetterModifier())
                    VStack(alignment: .leading) {
                        Text("Person's name")
                        Text("last seen yesterday")
                    }
                }
            }
        } header: {
            Text(letter)
        }
    }
}

let testLetters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                             "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                             "U", "V", "W", "X", "Y", "Z"]

struct ContactsView: View {

    @State private var contactSearch: String = ""
    let contactDetailList: [String] = ["A5", "B8", "C3", "D6", "E8", "F7"]

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ZStack {
                    List {
                        Button {
                            //
                        } label: {
                            HStack {
                                Image(systemName: "location.viewfinder")
                                    .resizable()
                                    .fontWeight(.light)
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25)
                                Text("Find People Nearby")
                                    .foregroundColor(.blue)
                            }
                        }
                        Button {
                            //
                        } label: {
                            HStack {
                                Image(systemName: "person.badge.plus")
                                    .resizable()
                                    .fontWeight(.light)
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25)
                                Text("Invite Friends")
                                    .foregroundColor(.blue)
                            }
                        }
                        ForEach(contactDetailList, id: \.self) { contact in
                            let letter: String = "\(contact.first?.description ?? "")"
                            let repeatingTimes: Int = .init("\(contact.last?.description ?? "")") ?? 0
                            ContactDetails(repeating: repeatingTimes, letter: letter).id(letter)
                        }
                    }
                    .listStyle(.plain)
                    HStack {
                        Spacer()
                        VStack(spacing: 0) {
                            ForEach(testLetters, id: \.self) { letter in
                                Button {
                                    withAnimation { proxy.scrollTo(letter, anchor: .bottom) }
                                } label: {
                                    Text(letter).font(.system(size: 13))
                                }
                            }
                        }
                        .padding(.trailing, 4)
                    }
                }
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // open new message here
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // edit contact list
                    } label: {
                        Text("Sort")
                    }
                }
            }
        }
        .searchable(text: $contactSearch, prompt: "Search")
    }

}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

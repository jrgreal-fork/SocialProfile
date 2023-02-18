//
//  ContentView.swift
//  SocialProfile
//
//  Created by Redge Real on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                Header(
                    name: "John Doe",
                    headshot: Image("bearded-man"),
                    cover: Image("cover"))
                Friends(friends: user.friends)
                Bio(
                    about: user.about,
                    birthday: user.birthday.formatted(date: .abbreviated, time: .omitted),
                    city: user.company,
                    company: user.city)
                .padding(.top, 16.0)
#if DEBUG
                Spacer()
                    .frame(height: 150.0)
                Text("**Base URL**: \(API.baseURL)")
                Text("**API key**: \(API.key)")
#endif
            }
        }
        .navigationTitle("Social Profile")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(user: .preview)
        }
    }
}
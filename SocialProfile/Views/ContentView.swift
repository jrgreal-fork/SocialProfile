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
                    name: user.name,
                    headshot: Image(uiImage:user.headshot),
                    cover: Image(uiImage: user.cover))
                Friends(friends: user.friends)
                Photos(user: user)
                Bio(
                    about: user.about,
                    birthday: user.birthday.formatted(date: .abbreviated, time: .omitted),
                    city: user.city,
                    company: user.company)
                .padding(.top, 16.0)
                Divider()
                    .padding(.horizontal, 8.0)
                ForEach(user.posts) { post in
                    VStack {
                        PostView(user: user, post: post)
                        Divider()
                    }
                    .padding()
                }
#if DEBUG
                Spacer()
                    .frame(height: 150.0)
                Text("**Base URL**: \(API.baseURL)")
                Text("**API key**: \(API.key)")
#endif
            }
        }
        .navigationTitle("Social Profile")
        .navigationDestination(for: User.self) { user in
            ContentView(user: user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(user: .preview)
        }
    }
}

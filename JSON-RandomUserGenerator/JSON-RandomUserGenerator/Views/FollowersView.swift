//
//  FollowersView.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 05/06/23.
//

import SwiftUI

struct FollowersView: View {
    @ObservedObject var followers = NetworkManager()
    @State var userName: String
    var gridItem: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItem) {
                    ForEach(followers.followers, id: \.self) { index in
                        NavigationLink {
                           // FollowersView(userName: index.login)
                            UserDetailView(userName: index.login, ImageURL: index.avatar_url)
                        } label: {
                            FollowerCell(imageURL: index.avatar_url, userName: index.login)
                        }
                        .navigationTitle(self.userName)
                    }
                }
            }.onAppear {
                followers.fetchFollowers(userName: self.userName)
        }
    }
}

//struct FollowersView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowersView()
//    }
//}

struct FollowerCell: View {
    @State  var imageURL: String
    @State  var userName: String
    var body: some View {
        VStack {
            UrlImageView(urlString: imageURL)
                .clipShape(Circle())
                .frame(width: 100,height: 100)
            Text(userName)
                .font(.title2)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
    }
}

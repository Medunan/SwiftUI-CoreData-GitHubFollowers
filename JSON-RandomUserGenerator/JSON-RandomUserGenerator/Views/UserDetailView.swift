//
//  UserDetailView.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 05/06/23.
//

import SwiftUI

struct UserDetailView: View {
    @State var userName: String = ""
    @State var ImageURL: String = ""
    @ObservedObject var data = NetworkManager()
    var body: some View {
        VStack {
            Rectangle()
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width * 0.95, height: 300)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5)
                .overlay (
                    VStack {
                        HStack {
                            VStack {
                                UrlImageView(urlString: data.user.avatar_url)
                                    .clipShape(Circle())
                                .frame(width: 140, height: 140)
                                
                                Text(data.user.login)
                            }                            
                            VStack(alignment: .center) {
                                Text("Repos")
                                Text(String(data.user.public_repos))
                            }
                            .fontWeight(.semibold)
                            
                            VStack(alignment: .center) {
                                Text("Followers")
                                Text(String(data.user.followers))
                            }
                            .fontWeight(.semibold)
                            .padding(.leading, 40)
                            
                            Spacer()
                        }
                        
                        NavigationLink {
                            FollowersView(userName: data.user.login)
                        } label: {
                            Text("Show Followers")
                                .foregroundColor(.black)
                                .padding()
                                .cornerRadius(10)
                                .background(Rectangle().fill())
                        }
                        
                        Button {
                            PersistanceController.shared.save(avatarURL: data.user.avatar_url, login: data.user.login)
                        } label: {
                            Text("Save Profile")
                                .foregroundColor(.black)
                                .padding()
                                .background {
                                    Color(.systemGray5)
                                }
                        }

                    }
                )
                
            Spacer()
        }
        .onAppear {
            data.fetchUser(userName: self.userName)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}

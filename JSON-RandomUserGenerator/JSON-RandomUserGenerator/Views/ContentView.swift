//
//  ContentView.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 05/06/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
        }
    }
}

struct ContentView: View {
    @ObservedObject var model = NetworkManager()
    @State var title: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("GitHub Info")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                Spacer()
            }
            Spacer()
            
            TextField("Enter the UserName", text: $title)
                .padding()
                .frame(minWidth: 0,maxWidth: .infinity)
                .frame(height: 55)
                .background(content: {
                    Color(UIColor(.gray))
                        .opacity(0.7)
                })
            NavigationLink {
                                UserDetailView(userName: title)
//                FollowersView(userName: title)
            } label: {
                Text("Search")
                    .foregroundColor(.white)
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height: 55)
                    .background(content: {
                        Color(UIColor(.red))
                            .opacity(0.7)
                    })
            }
            .disabled(title == "")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

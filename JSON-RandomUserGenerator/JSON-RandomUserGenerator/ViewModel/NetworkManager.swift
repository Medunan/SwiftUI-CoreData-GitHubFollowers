//
//  NetworkManager.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 05/06/23.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var user: User = User(login: "", avatar_url: "", public_repos: 0, public_gists: 0, html_url: "", following: 0, followers: 0, created_at: "")
    @Published var followers: [Follower] = []
    let baseURL = "https://api.github.com/users/"
    
    func fetchFollowers(userName: String) {
        guard let url = URL(string: "\(baseURL)\(userName)/followers") else {
            print("URL ERROR")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Data Error")
                return
            }
            
            print(String(data: data, encoding: .utf8))
            
            guard let followers = try? JSONDecoder().decode([Follower].self, from: data) else {
                print("Extaction Error")
                return
            }
            DispatchQueue.main.async {
                self.followers = followers
                print(self.followers)
                print(self.followers.count)
            }
        }.resume()
    }
    
    func fetchUser(userName: String) {
        guard let url = URL(string: "\(baseURL)\(userName)")  else {
            print("URL ERROR")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Data Error")
                return
            }
            
            print(data)
            guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                print("Extaction Error")
                return
            }
            DispatchQueue.main.async {
                self.user = user
                print(self.user)
            }
        }.resume()
    }
}

//
//  Model.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 05/06/23.
//

import SwiftUI
import Foundation

struct User: Codable,Hashable {
    var login: String
    var avatar_url: String
    var name: String?
    var location: String?
    var bio: String?
    var public_repos: Int
    var public_gists: Int
    var html_url: String
    var following: Int
    var followers: Int
    var created_at: String
}

struct Follower: Codable, Hashable {
    var login: String
    var avatar_url: String
}



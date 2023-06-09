//
//  FavoriteView.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 09/06/23.
//

import SwiftUI

struct FavoriteView: View {
    @FetchRequest(entity: UserEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.login, ascending: false)])
  
    var coreDatas: FetchedResults<UserEntity>
    var body: some View {
        VStack {
            HStack {
                Text("Favorites")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding()
                Spacer()
            }
            List {
                ForEach(coreDatas,id: \.self) { index in
                    NavigationLink {
                        UserDetailView(userName: index.login ?? "", ImageURL: index.avatar_url ?? "")
                    } label: {
                        HStack {
                            UrlImageView(urlString: index.avatar_url)
                                .frame(width: 50,height: 50)
                            Spacer()
                            Text(index.login ?? "")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                    }

                }
            }
            Spacer()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}

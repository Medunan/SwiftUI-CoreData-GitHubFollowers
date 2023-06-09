//
//  PersistanceManager.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 09/06/23.
//

import Foundation
import CoreData

// MARK: - CoreData Manager
class PersistanceController {
    static var shared = PersistanceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("Error\(error),\(error.userInfo)")
            } else {
                print("CoreData Created Successfully")
            }
        }
    }
    
    //MARK: - Function To Save In CoreData
    func save(avatarURL: String, login: String) {
        let attributes = UserEntity(context: container.viewContext)
        attributes.avatar_url = avatarURL
        attributes.login = login
        
        
        do {
            try container.viewContext.save()
        } catch {
            print("Save Error")
        }
    }
}

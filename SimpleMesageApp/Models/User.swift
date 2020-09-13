//
//  File.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

struct User {
    let login: String
    let password: String
    let profile: Profile
}

extension User {
    static func getUsers() -> [User] {
        DataManager.shared.users
    }
    
    static func auth(login: String, password: String) -> User? {
        for user in getUsers() {
            if user.login == login && user.password == password {
                return user
            }
        }
        return nil
    }
    
    static func getUser(by type: PersonType) -> User? {
        for user in getUsers() {
            if user.profile.type == type {
                return user
            }
        }
        return nil
    }
}

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
        var users: [User] = []
        users.append(DataManager.shared.userOne)
        users.append(DataManager.shared.userTwo)
        return users
    }
}

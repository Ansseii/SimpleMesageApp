//
//  File.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

struct User {
    let type: PersonType
    let login: String
    let password: String
    let name: String
    let surname: String
    let avatar: String
    let about: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
}

enum PersonType {
    case tim
    case bill
}

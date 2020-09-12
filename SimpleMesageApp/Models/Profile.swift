//
//  Profile.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

struct Profile {
    let type: PersonType
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

extension Profile {
    func setMessage(message: Message) {
        DataManager.shared.messages.append(message)
    }

    func getMessages() -> [Message] {
        DataManager.shared.messages
    }
}

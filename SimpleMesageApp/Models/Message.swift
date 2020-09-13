//
//  Message.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

struct Message {
    let text: String
    let person: Profile
}

extension Message {
    static func setMessage(message: Message) {
        DataManager.shared.messages.append(message)
    }
    
    static func getMessages() -> [Message] {
        var messages = DataManager.shared.messages
        
        if messages.count == 0 {
            messages = DataManager.shared.defaultMessages
        }
        
        return messages
    }
}

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
        let dataManager = DataManager.shared
        
        if dataManager.messages.count == 0 {
            dataManager.messages = dataManager.defaultMessages
        }
        
        return dataManager.messages      
    }
    
    static func botMessage(input message: Message) -> Message? {
        for (key, value) in DataManager.shared.botMessages {
            if (key == message.text) && (message.person.type != value.person.type){
                return value
            }
        }
        return nil
    }
}

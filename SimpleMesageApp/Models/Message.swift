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
  
  static func getBotMessage(for pattern: Message) -> Message? {
    DataManager.shared.botMessages[pattern]
  }
}

extension Message: Hashable {
  static func == (lhs: Message, rhs: Message) -> Bool {
    lhs.text == rhs.text && lhs.person == rhs.person
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(text)
    hasher.combine(person)
  }
}

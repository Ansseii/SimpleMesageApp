//
//  DataManager.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//
import UIKit

class DataManager {
  
  static let shared = DataManager()
  
  private init() {}
  
  private let userOne = User(login: "tim",
                             password: "123",
                             profile: Profile(type: .tim,
                                              name: "Tim",
                                              surname: "Cook",
                                              birthDate: "1 November 1960",
                                              birthPlace: "Mobile, Alabama, U.S.",
                                              avatar: "tim",
                                              about: """
Timothy Donald Cook is an American business executive, philanthropist and industrial engineer. Cook is the chief executive officer of Apple Inc., and previously served as the company's chief operating officer under its cofounder Steve Jobs.
Cook joined Apple in March 1998 as a senior vice president for worldwide operations, and then served as the executive vice president for worldwide sales and operations. He was made the chief executive on August 24, 2011, prior to Jobs' death in October of that year. During his tenure as the chief executive, he has advocated for the political reformation of international and domestic surveillance, cybersecurity, American manufacturing, and environmental preservation. Since 2011 when he took over Apple, to 2020, Cook doubled the company’s revenue and profit, and increased its market value from $348 billion to $1.9 trillion. In 2014, Cook became the first chief executive of a Fortune 500 company to publicly come out as gay. Cook also serves on the boards of directors of Nike, Inc.,the National Football Foundation, and is a trustee of Duke University. In March 2015, he said he planned to donate his entire stock fortune to charity.
"""))
  
  private let userTwo = User(login: "bill",
                             password: "123",
                             profile: Profile(type: .bill,
                                              name: "Bill",
                                              surname: "Gates",
                                              birthDate: "28 October 1955",
                                              birthPlace: "Seattle, Washington, U.S.",
                                              avatar: "bill",
                                              about: """
William Henry Gates III is an American business magnate, software developer, investor, and philanthropist. He is best known as the co-founder of Microsoft Corporation. During his career at Microsoft, Gates held the positions of chairman, chief executive officer (CEO), president and chief software architect, while also being the largest individual shareholder until May 2014. He is one of the best-known entrepreneurs and pioneers of the microcomputer revolution of the 1970s and 1980s.
"""))
  
  
  var users: [User] {
    [userOne, userTwo]
  }
  
  var defaultMessages: [Message] { [
    Message(text: "Привет Билл", person: userOne.profile),
    Message(text: "Привет Тим", person: userTwo.profile)
    ]
  }
  
  var messages: [Message] = []
  
  var botMessages: [Message : Message] {
    [
      Message(text: "Когда сделаете нормальный тачпад?)", person: userOne.profile) :
        Message(text: "Для игр тачпад не нужен 😉", person: userTwo.profile),
      Message(text: "У тебя есть яблоки?", person: userTwo.profile) :
        Message(text: "Есть, но только надкусанные. 😉", person: userOne.profile)
    ]
  }
  
  let billPictures = [UIImage(named: "Bill_Gates_1"),
                      UIImage(named: "Bill_Gates_2"),
                      UIImage(named: "Bill_Gates_3"),
                      UIImage(named: "Bill_Gates_4"),
                      UIImage(named: "Bill_Gates_5")]
  
  let timPictures = [UIImage(named: "Tim_Cook_1"),
                     UIImage(named: "Tim_Cook_2"),
                     UIImage(named: "Tim_Cook_4"),
                     UIImage(named: "Tim_Cook_5")]
}

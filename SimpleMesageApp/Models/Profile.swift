//
//  Profile.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//
import UIKit

struct Profile: Hashable {
  let type: PersonType
  let name: String
  let surname: String
  let birthDate: String
  let birthPlace: String
  let avatar: String
  let about: String
  
  var fullname: String {
    "\(name) \(surname)"
  }
}

extension Profile {
  static func getAllImages(for person: PersonType) -> [UIImage?] {
    switch person {
    case .tim:
      return DataManager.shared.timPictures
    case .bill:
      return DataManager.shared.billPictures
    }
  }
}

enum PersonType {
  case tim
  case bill
}


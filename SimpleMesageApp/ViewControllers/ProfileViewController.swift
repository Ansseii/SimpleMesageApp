//
//  ProfileViewController.swift
//  SimpleMesageApp
//
//  Created by Aleksandr on 13.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
  
  @IBOutlet weak var profileImage: UIImageView!
  
  @IBOutlet weak var profileFullName: UILabel!
  @IBOutlet weak var profileAbout: UILabel!
  
  var currentProfile: Profile!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    profileImage.image = UIImage(named: currentProfile.avatar)
    profileFullName.text = currentProfile.fullname
    profileAbout.text = currentProfile.about
  }
}

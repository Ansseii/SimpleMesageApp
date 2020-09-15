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
  @IBOutlet weak var birthDateLabel: UILabel!
  @IBOutlet weak var wasBornLabel: UILabel!
  
  @IBOutlet weak var photosCollectionView: UICollectionView!
  
  var currentProfile: Profile!
  
  private var loggedUserImages: [UIImage?] {
    Profile.getAllImages(for: currentProfile.type)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    photosCollectionView.register(CustomCell.self,
                                  forCellWithReuseIdentifier: "cell")
    photosCollectionView.frame = .zero
    
    photosCollectionView.dataSource = self
    photosCollectionView.delegate = self
    
    profileImage.image = UIImage(named: currentProfile.avatar)
    profileFullName.text = currentProfile.fullname
    profileAbout.text = currentProfile.about
    birthDateLabel.text = currentProfile.birthDate
    wasBornLabel.text = currentProfile.birthPlace
  }
}

extension ProfileViewController: UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width,
                  height: collectionView.frame.width)
  }
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    loggedUserImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                  for: indexPath) as! CustomCell
    cell.data = loggedUserImages[indexPath.item]
    return cell
  }
}

class CustomCell: UICollectionViewCell {
  
  var data: UIImage? {
    didSet {
      guard let data = data else { return }
      image.image = data
    }
  }
  
  fileprivate let image: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.layer.cornerRadius = 12
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    contentView.addSubview(image)
    
    image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    image.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
    image.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

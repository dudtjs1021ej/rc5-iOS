//
//  CommunityMenuCollectionViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import UIKit

class CommunityMenuCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var menuButton: UIButton!
  override func awakeFromNib() {
    super.awakeFromNib()
    menuButton.layer.borderWidth = 1
    menuButton.layer.borderColor = UIColor(named: "lightGrayColor")?.cgColor
    menuButton.layer.cornerRadius = 18
  }

}

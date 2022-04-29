//
//  CommunityMenuCollectionViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import UIKit

class CommunityMenuCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var tagLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    tagLabel.layer.borderWidth = 1
    tagLabel.layer.borderColor = UIColor(named: "lightGrayColor")?.cgColor
    tagLabel.layer.cornerRadius = 18
  }

}

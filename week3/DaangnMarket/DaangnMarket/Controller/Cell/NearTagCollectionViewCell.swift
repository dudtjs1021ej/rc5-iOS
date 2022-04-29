//
//  NearTagCollectionViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class NearTagCollectionViewCell: UICollectionViewCell {

  
  @IBOutlet weak var tagTextLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    tagTextLabel.layer.borderWidth = 1
    tagTextLabel.layer.borderColor = UIColor(named: "lightGrayColor")?.cgColor
    tagTextLabel.layer.cornerRadius = 18
  }

}

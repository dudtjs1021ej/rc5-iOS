//
//  WeeklyChartCollectionViewCell.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit

class WeeklyChartCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var salesLabel: UILabel!
  @IBOutlet weak var audiAccLabel: UILabel!
  
  override func prepareForReuse() {
    posterImageView.image = UIImage(named: "noImage")
  }
}

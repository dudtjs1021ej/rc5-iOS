//
//  HomeTableViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/27.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var reuploadLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var chatCountLabel: UILabel!
  @IBOutlet weak var heartCountLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    productImageView.layer.cornerRadius = 10
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
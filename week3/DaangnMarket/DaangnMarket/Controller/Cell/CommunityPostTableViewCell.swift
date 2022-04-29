//
//  CommunityPostTableViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import UIKit

class CommunityPostTableViewCell: UITableViewCell {

  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var postTextView: UITextView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    categoryLabel.layer.cornerRadius = 5
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  }
    
}

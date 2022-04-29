//
//  ChatTableViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nickNameLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var chatLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    productImageView.layer.cornerRadius = 10
        
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}

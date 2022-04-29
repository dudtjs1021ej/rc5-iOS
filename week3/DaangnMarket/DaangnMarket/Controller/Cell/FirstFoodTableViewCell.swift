//
//  FirstFoodTableViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/30.
//

import UIKit

class FirstFoodTableViewCell: UITableViewCell {

  @IBOutlet weak var storeLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  @IBOutlet weak var storeTextView: UITextView!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var nicknameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

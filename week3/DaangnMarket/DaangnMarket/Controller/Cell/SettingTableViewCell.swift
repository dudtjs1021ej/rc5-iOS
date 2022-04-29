//
//  SettingTableViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

  @IBOutlet weak var settingImageView: UIImageView!
  @IBOutlet weak var label: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

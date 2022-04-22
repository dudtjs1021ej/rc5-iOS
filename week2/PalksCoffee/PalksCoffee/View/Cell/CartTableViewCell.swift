//
//  CartTableViewCell.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {

  @IBOutlet weak var menuImageView: UIImageView!
  @IBOutlet weak var menuLabel: UILabel!
  @IBOutlet weak var optionLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

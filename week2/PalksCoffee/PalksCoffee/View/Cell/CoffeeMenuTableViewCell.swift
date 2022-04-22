//
//  CoffeeMenuTableViewCell.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

class CoffeeMenuTableViewCell: UITableViewCell {

  @IBOutlet weak var coffeeImageView: UIImageView!
  @IBOutlet weak var menuLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}

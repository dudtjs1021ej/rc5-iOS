//
//  HomeTableViewCell.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/27.
//

import UIKit

protocol CellButtonDelegate: AnyObject {
  func clickedDot()
}

class HomeTableViewCell: UITableViewCell {
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var chatCountLabel: UILabel!
  @IBOutlet weak var heartCountLabel: UILabel!
  @IBOutlet weak var chatImageView: UIImageView!
  @IBOutlet weak var heartImageView: UIImageView!
  @IBOutlet weak var dotButton: UIButton!
  
  var delegate: CellButtonDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    productImageView.layer.cornerRadius = 10
    heartImageView.isHidden = true
    chatImageView.isHidden = true
    dotButton.isHidden = true
    
  }
  
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    dotButton.addTarget(self, action: #selector(clickedDot), for: .touchUpInside)
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }
  
//  @objc func clickedDot() {
//    delegate?.clickedDot()
//  }
}

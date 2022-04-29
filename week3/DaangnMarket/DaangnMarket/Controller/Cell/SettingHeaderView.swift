//
//  SettingHeaderView.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import Foundation
import UIKit

class SettingHeaderView: UIView {

  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var rightButton: UIButton!
  @IBOutlet weak var payView: UIView!
  @IBOutlet weak var payImageView: UIImageView!
  @IBOutlet weak var payLabel: UILabel!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var stackView1: UIStackView!
  @IBOutlet weak var menuImageView1: UIImageView!
  @IBOutlet weak var menuButton1: UIButton!
  @IBOutlet weak var stackView2: UIStackView!
  @IBOutlet weak var menuImageView2: UIImageView!
  @IBOutlet weak var menuButton2: UIButton!
  @IBOutlet weak var stackView3: UIStackView!
  @IBOutlet weak var menuImageView3: UIImageView!
  @IBOutlet weak var menuButton3: UIButton!
  
  override init(frame: CGRect) {
    
    super.init(frame: frame)
  }
      
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}

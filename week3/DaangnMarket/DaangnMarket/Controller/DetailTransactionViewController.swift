//
//  DetailTransactionViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class DetailTransactionViewController: UIViewController {

  @IBOutlet weak var detailTextView: UITextView!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var nickname: UILabel!
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var chatButton: UIButton!
  @IBOutlet weak var heartLabel: UILabel!
  @IBOutlet weak var chatLabel: UILabel!
  var transaction: TransactionModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.tintColor = .black
    self.navigationController?.navigationBar.topItem?.title = ""
    
    heartLabel.isHidden = true
    chatLabel.isHidden = true
    
    
    chatButton.layer.cornerRadius = 5
    if let transaction = transaction {
      nickname.text = transaction.nickname
      locationLabel.text = transaction.location
      timeLabel.text = transaction.time
      priceLabel.text = decimalWon(value: transaction.price)
      detailTextView.text = transaction.detail
      titleLabel.text = transaction.title
      if let images = transaction.images {
        productImageView.image = images[0]
      }
      if let heart = transaction.heart {
        heartLabel.isHidden = false
        heartLabel.text = "관심 \(String(heart))"
      }
      if let chat = transaction.chat {
        chatLabel.isHidden = false
        chatLabel.text = "채팅 \(String(chat))"
      }
    }
   
  }
  
  // 숫자 세자리마다 콤마 넣기
  func decimalWon(value: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
    return result
  }

}

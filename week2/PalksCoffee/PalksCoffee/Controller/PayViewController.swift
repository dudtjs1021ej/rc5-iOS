//
//  PayViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/23.
//

import UIKit

class PayViewController: UIViewController {

  @IBOutlet weak var sumCountLabel: UILabel!
  @IBOutlet weak var sumPriceLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var couponButton: UIButton!
  @IBOutlet weak var giftButton: UIButton!
  
  @IBOutlet var takeOutButtons: [UIButton]!
  @IBOutlet var payButtons: [UIButton]!
  
  let cart = Cart.shared
  var takeoutButtonSelectedIndex = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 장바구니 데이터 초기화
    let sumCount = cart.count.reduce(0, +)
    sumCountLabel.text = "총 \(String(sumCount))개"
    let sumPrice = cart.price.reduce(0, +)
    sumPriceLabel.text = "\(String(sumPrice))원"
    
    // 버튼 테두리 추가
    couponButton.layer.borderWidth = 1
    couponButton.layer.borderColor = UIColor(named: "palkColor")?.cgColor
    couponButton.layer.cornerRadius = 15
    
    giftButton.layer.borderWidth = 1
    giftButton.layer.borderColor = UIColor(named: "palkColor")?.cgColor
    giftButton.layer.cornerRadius = 15
    
    // 포장버튼 테두리, action 추가
    for button in takeOutButtons{
      button.layer.cornerRadius = 20
      button.layer.borderWidth = 1
      button.layer.borderColor = UIColor(named: "palkColor")?.cgColor
  
      button.addTarget(self, action: #selector(takeOutButtonAction), for: .touchUpInside)
    }
    
    // 결제버튼 테두리, action 추가
    for button in payButtons{
      button.layer.cornerRadius = 20
      button.layer.borderWidth = 1
      button.layer.borderColor = UIColor(named: "palkColor")?.cgColor
  
      button.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
    }
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  @IBAction func clickedCancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func takeOutButtonAction(_ sender: UIButton) {
    for (index, button) in takeOutButtons.enumerated() {
      if button == sender { // 선택된 버튼만 배경색 넣어줌
        self.takeoutButtonSelectedIndex = index
        button.backgroundColor = UIColor(named: "palkColor")
        button.tintColor = .white
      } else {
        button.backgroundColor = .white
        button.tintColor = UIColor(named: "palkColor")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "palkColor")?.cgColor
      }
    }
  }
  
  @objc func payButtonAction(_ sender: UIButton) {
    for (index, button) in payButtons.enumerated() {
      if button == sender { // 선택된 버튼만 배경색 넣어줌
        self.takeoutButtonSelectedIndex = index
        button.backgroundColor = UIColor(named: "palkColor")
        button.tintColor = .white
      } else {
        button.backgroundColor = .white
        button.tintColor = UIColor(named: "palkColor")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "palkColor")?.cgColor
      }
    }
  }
  @IBAction func clickedOrder(_ sender: Any) {
    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
  }
}

extension PayViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cart.menu.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell")
            as? CartTableViewCell else { return UITableViewCell() }
    cell.menuLabel.text = cart.menu[indexPath.row]
    cell.countLabel.text = String(cart.count[indexPath.row])
    cell.priceLabel.text = "\(String(cart.price[indexPath.row]))원"
    cell.menuImageView.image = UIImage(named: cart.imageName[indexPath.row])
    if cart.option[indexPath.row] != 0 {
      cell.optionLabel.text = "ㄴ 샷추가(\(cart.option[indexPath.row]))"
    }
   
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
}

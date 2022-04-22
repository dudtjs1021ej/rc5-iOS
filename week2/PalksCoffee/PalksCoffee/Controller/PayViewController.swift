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
  
  let cart = Cart.shared
  override func viewDidLoad() {
    super.viewDidLoad()
    let sumCount = cart.count.reduce(0, +)
    sumCountLabel.text = "총 \(String(sumCount))개"
    let sumPrice = cart.price.reduce(0, +)
    sumPriceLabel.text = "\(String(sumPrice))원"
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  @IBAction func clickedCancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
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

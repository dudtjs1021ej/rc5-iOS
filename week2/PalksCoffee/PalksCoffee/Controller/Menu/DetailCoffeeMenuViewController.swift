//
//  DetailCoffeeMenuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

class DetailCoffeeMenuViewController: UIViewController {

  @IBOutlet weak var coffeeImageView: UIImageView!
  @IBOutlet weak var menuLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  
  var price: Int = 0
  var count: Int = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  @IBAction func clickedMinus(_ sender: Any) {
    if count > 1 { // 0이 되지 않게
      count -= 1
      countLabel.text = String(count)
      priceLabel.text = "\(String(price*count))원"
    }
  }
  @IBAction func clickedPlus(_ sender: Any) {
    count += 1
    countLabel.text = String(count)
    priceLabel.text = "\(String(price*count))원"
  }
  @IBAction func clickedCart(_ sender: Any) {
    dismiss(animated: true)
  }
}

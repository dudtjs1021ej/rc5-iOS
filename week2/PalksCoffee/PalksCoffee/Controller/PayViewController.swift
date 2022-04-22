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
  let cart = Cart.shared
  override func viewDidLoad() {
    super.viewDidLoad()
    let sumCount = cart.count.reduce(0, +)
    sumCountLabel.text = "총 \(String(sumCount))개"
    let sumPrice = cart.price.reduce(0, +)
    sumPriceLabel.text = "\(String(sumPrice))원"


  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

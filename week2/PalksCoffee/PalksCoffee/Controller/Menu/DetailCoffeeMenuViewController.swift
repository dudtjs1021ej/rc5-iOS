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
  @IBOutlet weak var optionLabel: UILabel!
  
  var price: Int = 0
  var coffeeCount: Int = 1
  var optionCount: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  @IBAction func clickedCancel(_ sender: Any) {
    dismiss(animated: true)
  }
  @IBAction func clickedMinus(_ sender: Any) {
    if coffeeCount > 1 { // 0이 되지 않게
      coffeeCount -= 1
      countLabel.text = String(coffeeCount)
      priceLabel.text = "\(String(price*coffeeCount))원"
    }
  }
  @IBAction func clickedPlus(_ sender: Any) {
    coffeeCount += 1
    countLabel.text = String(coffeeCount)
    priceLabel.text = "\(String(price*coffeeCount))원"
  }
  @IBAction func clickedCart(_ sender: Any) {
    dismiss(animated: true)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "optionSegue" {
      guard let vc: OptionMenuViewController = segue.destination as? OptionMenuViewController else { return }
      vc.delegate = self
    }
  }
}

extension DetailCoffeeMenuViewController: OptionCountProtocol {
  func dataSend(optionCount: Int) {
    print("dataSend")
    self.optionCount = optionCount
    if optionCount != 0 {
      optionLabel.text = "샷추가(\(String(optionCount)))"
    }
  }
}

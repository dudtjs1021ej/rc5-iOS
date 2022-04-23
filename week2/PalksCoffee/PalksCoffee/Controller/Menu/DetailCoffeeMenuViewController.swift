//
//  DetailCoffeeMenuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

class DetailCoffeeMenuViewController: UIViewController {
  
  // MARK: - Properties

  @IBOutlet weak var coffeeImageView: UIImageView!
  @IBOutlet weak var menuLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var optionLabel: UILabel!
  
  var price: Int = 0
  var coffeeCount: Int = 1
  var optionCount: Int = 0
  var imageName: String = ""
  var sumPrice: Int {
    return price*coffeeCount + (500*optionCount)
  }
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Methods
  
  @IBAction func clickedCancel(_ sender: Any) {
    dismiss(animated: true)
  }
  
  @IBAction func clickedMinus(_ sender: Any) {
    if coffeeCount > 1 { // 0이 되지 않게
      coffeeCount -= 1
      countLabel.text = String(coffeeCount)
      priceLabel.text = "\(String(sumPrice))원"
    }
  }
  
  @IBAction func clickedPlus(_ sender: Any) {
    coffeeCount += 1
    countLabel.text = String(coffeeCount)
    priceLabel.text = "\(String(sumPrice))원"
  }
  
  @IBAction func clickedCart(_ sender: Any) {
    let cart = Cart.shared
    // 싱글턴패턴 -> 공통 프로퍼티에 장바구니 목록 담음
    cart.price.append(sumPrice)
    cart.menu.append(menuLabel.text ?? "")
    cart.option.append(optionCount)
    cart.count.append(coffeeCount)
    cart.imageName.append(imageName)
    
    // 장바구니 데이터를 set하기 위해 NotificationCenter post
    NotificationCenter.default.post(name: NSNotification.Name("setCartData"), object: nil)
    dismiss(animated: true)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "optionSegue" {
      guard let vc: OptionMenuViewController = segue.destination as? OptionMenuViewController else { return }
      vc.delegate = self
    }
  }
}

// MARK: - OptionCountProtocol

extension DetailCoffeeMenuViewController: OptionCountProtocol {
  func dataSend(optionCount: Int) {
    self.optionCount = optionCount
    if optionCount != 0 {
      optionLabel.text = "샷추가(\(String(optionCount)))"
    }
    priceLabel.text = "\(String(sumPrice))원"
  }
}

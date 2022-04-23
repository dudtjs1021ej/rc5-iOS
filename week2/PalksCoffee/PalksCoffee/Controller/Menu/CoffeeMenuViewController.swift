//
//  CoffeeMenuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

class CoffeeMenuViewController: UIViewController {

  //MARK: - Properties
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var sumCountLabel: UILabel!
  @IBOutlet weak var sumPriceLabel: UILabel!
  @IBOutlet weak var payButton: UIButton!
  
  let menu: [String] = ["더블에스프레소", "앗메리카노(HOT)", "앗메리카노(ICED)", "원조커피(HOT)", "원조커피(ICED)",
                        "카페모카(HOT)", "카페모카(ICED)", "빽's라떼(HOT)", "빽's라떼(ICED)", "바닐라라떼(HOT)", "바닐라라떼(ICED)"]
  let price: [Int] = [1500, 1500, 2000, 2500, 2500, 3500, 3500, 3000, 3000, 3500, 3500]
  let imageViewName: [String] = ["espresso", "americano_hot","americano_ice", "original_hot", "original_ice", "moca_hot", "moca_ice", "lattee_hot", "lattee_ice", "ba_hot", "ba_ice"]
  
  let cart = Cart.shared
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
    payButton.layer.cornerRadius = 10
    
    // 장바구니 목록을 보여주기 위한 NotificationCenter
    NotificationCenter.default.addObserver(self, selector: #selector(setCartData), name: NSNotification.Name("setCartData"), object: nil)
  }
  @objc func setCartData(_ notification: NSNotification) {
    let sumCount = cart.count.reduce(0, +)
    sumCountLabel.text = "총 \(String(sumCount))개"
    let sumPrice = cart.price.reduce(0, +)
    sumPriceLabel.text = "\(String(sumPrice))원"
  }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension CoffeeMenuViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menu.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath)
            as? CoffeeMenuTableViewCell else { return UITableViewCell() }
    cell.selectionStyle = .none // 선택 효과 제거
    cell.menuLabel.text = menu[indexPath.row]
    cell.priceLabel.text = "\(String(price[indexPath.row]))원"
    cell.coffeeImageView.image = UIImage(named: imageViewName[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 115
  }
  
  // cell 선택
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailCoffeeMenu")
            as? DetailCoffeeMenuViewController else { return }
    present(vc, animated: true, completion: nil)
    vc.price = price[indexPath.row]
    vc.menuLabel.text = menu[indexPath.row]
    vc.priceLabel.text = "\(String(price[indexPath.row]))원"
    vc.coffeeImageView.image = UIImage(named: imageViewName[indexPath.row])
    vc.imageName = imageViewName[indexPath.row]
  }
}

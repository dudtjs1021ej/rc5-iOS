//
//  CoffeeMenuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

class CoffeeMenuViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  let menu: [String] = ["더블에스프레소", "앗메리카노(HOT)", "앗메리카노(ICED)", "원조커피(HOT)", "원조커피(ICED)"]
  let price: [Int] = [1500, 1500, 2000, 2500, 2500]
  let imageViewName: [String] = ["espresso", "americano_hot","americano_ice", "original_hot", "original_ice"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
}

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
  }
  
}

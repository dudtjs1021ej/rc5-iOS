//
//  DrinkMenuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/23.
//

import UIKit

class DrinkMenuViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  let menu: [String] = ["딸기라떼(ICED)", "쑥쑥라떼(HOT)", "쑥쑥라떼(ICED)", "호떡라떼(HOT)", "호떡라떼(ICED)",
                        "초코라떼(HOT)", "초코라떼(ICED)", "녹차라떼(HOT)", "녹차라떼(ICED)"]
  let price: [Int] = [3500, 3500, 3500, 4000, 4000,
                      3500, 3500, 3500, 3500]
  let imageViewName: [String] = ["st_ice","ss_hot", "ss_ice", "ho_hot", "ho_ice",
                                  "cho_hot", "cho_ice", "green_hot", "green_ice"]
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
      
  }
}

extension DrinkMenuViewController: UITableViewDataSource, UITableViewDelegate {
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
}

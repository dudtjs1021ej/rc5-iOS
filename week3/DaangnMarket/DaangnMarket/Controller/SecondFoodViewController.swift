//
//  SecondFoodViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/30.
//

import UIKit

class SecondFoodViewController: UIViewController {

  @IBOutlet weak var secondFoodTableView: UITableView!
  let stores = ["CU 편의점", "붕어빵집", "어묵가게"]
  let foods = ["군고구마", "붕어빵", "어묵"]
  let times = ["2022.4.5 업데이트" ,"2022.4.10 업데이트", "2022.4.21 업데이트"]
  override func viewDidLoad() {
    super.viewDidLoad()
    secondFoodTableView.register(UINib(nibName: "SecondFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondFoodCell")
    secondFoodTableView.delegate = self
    secondFoodTableView.dataSource = self

        
  }
}


extension SecondFoodViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stores.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = secondFoodTableView.dequeueReusableCell(withIdentifier: "SecondFoodCell")
            as? SecondFoodTableViewCell else { return UITableViewCell() }
    cell.storeLabel.text = stores[indexPath.row]
    cell.foodLabel.text = foods[indexPath.row]
    cell.timeLabel.text = times[indexPath.row]
    return cell
      
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
}

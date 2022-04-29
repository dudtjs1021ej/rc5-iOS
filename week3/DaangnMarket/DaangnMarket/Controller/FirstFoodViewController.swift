//
//  FirstFoodViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/30.
//

import UIKit

class FirstFoodViewController: UIViewController {

  @IBOutlet weak var firstFoodTableView: UITableView!
  let stores = ["엘토레", "열두시테이블", "가츠잇"]
  let detailTexts = ["멕시칸 좋아하시는 분들 꼭 드셔보세요!", "존맛탱", "돈까스 맛있어서 종종 가요"]
  let times = ["27일 전", "약 1개월 전", "약 1개월 전"]
  let nicknames = ["젤리님의 추천", "미미님의 추천", "제라님의 추천"]
  override func viewDidLoad() {
    super.viewDidLoad()
    firstFoodTableView.register(UINib(nibName: "FirstFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstFoodCell")
    firstFoodTableView.delegate = self
    firstFoodTableView.dataSource = self
        
  }
}

extension FirstFoodViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stores.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = firstFoodTableView.dequeueReusableCell(withIdentifier: "FirstFoodCell")
            as? FirstFoodTableViewCell else { return UITableViewCell() }
    cell.timeLabel.text = times[indexPath.row]
    cell.nicknameLabel.text = nicknames[indexPath.row]
    cell.storeLabel.text = stores[indexPath.row]
    cell.storeTextView.text = detailTexts[indexPath.row]
    return cell
      
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
  
  
}

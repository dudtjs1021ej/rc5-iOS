//
//  ViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/25.
//

import UIKit

class HomeViewController: UIViewController {
  @IBOutlet weak var homeTableView: UITableView!
  
  let titles: [String] = ["스타벅스 캐리어", "내일 장농과 옷장 5만원에 가져가세요","아이폰 12프로 명품 케이스", "프라다 가방 크로스백 새제품",
                         "소다 스트림 기계", "라이테스 압박스타킹 블랙 색상 판매합니다.", "강아지 이동가방"]
  let locations: [String] = ["고양시 덕양구 화정동", "고양시 일산서구 주엽동", "고양시 일산서구 대화동", "고양시 덕양구 화정2동", "고양시 일산동구 중산동",
                            "고양시 일산서구 일산동", "고양시 일산서구 주엽동"]
  let imageViewName: [String] = ["homeImageView1", "homeImageView2", "homeImageView3", "homeImageView4", "homeImageView5",
                                 "homeImageView6", "homeImageView7"]
  let prices: [Int] = [30000, 50000, 12000, 8500000, 12000, 4000, 5000]
  let hearts: [Int] = [1, 2, 1, 3, 8, 1, 1]
  let chats: [Int] = [0, 1, 0, 0, 4, 1, 0]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCell")
    homeTableView.delegate = self
    homeTableView.dataSource = self
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "homeCell")
            as? HomeTableViewCell else { return UITableViewCell() }
    cell.productImageView.image = UIImage(named: imageViewName[indexPath.row])
    cell.titleLabel.text = titles[indexPath.row]
    cell.locationLabel.text = locations[indexPath.row]
    cell.priceLabel.text = "\(prices[indexPath.row])원"
    cell.heartCountLabel.text = String(hearts[indexPath.row])
    cell.chatCountLabel.text = String(chats[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 142
  }
}


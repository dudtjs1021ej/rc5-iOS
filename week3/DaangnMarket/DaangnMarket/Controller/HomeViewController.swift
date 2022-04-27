//
//  ViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/25.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var homeTableView: UITableView!
  
  let transactions = [
    TransactionModel(images: [UIImage(named: "homeImageView1")!], title: "스타벅스 캐리어", location: "고양시 덕양구 화정동", time: "5분 전", price: 30000, heart: 10, chat: nil, detail: "dfsfdsfsdfdsfsdfdsfdsfsd"),
    TransactionModel(images: [UIImage(named: "homeImageView2")!], title: "내일 장농과 옷장 5만원에 가져가세요", location: "고양시 일산서구 주엽동", time: "끌올 8분 전", price: 50000, heart: 1, chat: 2, detail: "dfsfdsfsdfdsfsdfdsfdsfsd"),
    TransactionModel(images: [UIImage(named: "homeImageView3")!], title: "아이폰 12프로 명품 케이스", location: "고양시 일산서구 대화동", time: "끌올 10분 전", price: 12000, heart: 3, chat: nil, detail: "dfsfdsfsdfdsfsdfdsfdsfsd"),
    TransactionModel(images: [UIImage(named: "homeImageView4")!], title: "프라다 가방 크로스백 새제품", location: "고양시 일산동구 중산동", time: "35분 전", price: 8500000, heart: 9, chat: 4, detail: "dfsfdsfsdfdsfsdfdsfdsfsd"),
    TransactionModel(images: [UIImage(named: "homeImageView5")!], title: "소다 스트림 기계", location: "고양시 일산서구 주엽동", time: "37분 전", price: 12000, heart: 1, chat: nil, detail: "dfsfdsfsdfdsfsdfdsfdsfsd"),
    TransactionModel(images: [UIImage(named: "homeImageView6")!], title: "라이테스 압박스타킹 블랙 색상 판매합니다.", location: "고양시 덕양구 화정2동", time: "38분 전", price: 8000, heart: nil, chat: nil, detail: "dfsfdsfsdfdsfsdfdsfdsfsd")
  ]
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCell")
    homeTableView.delegate = self
    homeTableView.dataSource = self
  }
  
  // MARK: Methods
  
  // 숫자 세자리마다 콤마 넣기
  func decimalWon(value: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
    return result
  }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return transactions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "homeCell")
            as? HomeTableViewCell else { return UITableViewCell() }
    let transaction = transactions[indexPath.row]
    cell.productImageView.image = transaction.images[0]
    cell.titleLabel.text = transaction.title
    cell.locationLabel.text = transaction.location
    cell.timeLabel.text = transaction.time
    cell.priceLabel.text = decimalWon(value: transaction.price)
    
    if let heart = transaction.heart {
      cell.heartCountLabel.text = String(heart)
      cell.heartImageView.isHidden = false
    }
    if let chat = transaction.chat {
      cell.chatCountLabel.text = String(chat)
      cell.chatImageView.isHidden = false
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 142
  }
}


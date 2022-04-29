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
  
  var transactions = [
    TransactionModel(nickname: "프레첼", images: [UIImage(named: "homeImageView1")!], title: "스타벅스 캐리어", location: "고양시 덕양구 화정동", time: "5분 전", price: 30000, heart: 10, chat: nil,
                     detail: "피크닉용으로 4번정도 사용해서\n생활기스가 있습니다\n사진 참고하시고\n감안해서 연락주세요."),
    TransactionModel(nickname: "젤리", images: [UIImage(named: "homeImageView2")!], title: "내일 장농과 옷장 5만원에 가져가세요", location: "고양시 일산서구 주엽동", time: "끌올 8분 전", price: 50000, heart: 1, chat: 2, detail: "깨끗한 장농 팝니다.\n5만원에 싸게 팔아요\n직접 가져가셔야돼요"),
    TransactionModel(nickname: "aady", images: [UIImage(named: "homeImageView3")!], title: "아이폰 12프로 명품 케이스", location: "고양시 일산서구 대화동", time: "끌올 10분 전", price: 12000, heart: 3, chat: nil, detail: "아이폰 명품 케이스 팔아요\n한번도 사용 안했어요\n상태좋습니다\n챗주세요"),
    TransactionModel(nickname: "쎄쎄쎼", images: [UIImage(named: "homeImageView4")!], title: "프라다 가방 크로스백 새제품", location: "고양시 일산동구 중산동", time: "35분 전", price: 8500000, heart: 9, chat: 4, detail: "프라다 정품 보증카드 있어요\n오래된 가방이긴한데\n상태는 좋습니다\n빨리 가져가세요"),
    TransactionModel(nickname: "할로", images: [UIImage(named: "homeImageView5")!], title: "소다 스트림 기계", location: "고양시 일산서구 주엽동", time: "37분 전", price: 12000, heart: 1, chat: nil, detail: "통은 어디갔는지 몰겠어요\n가스 사서 쓰심돼요^^\n탄산수 많이 드시는분 가져가세요"),
    TransactionModel(nickname: "구구", images: [UIImage(named: "homeImageView6")!], title: "라이테스 압박스타킹 블랙 색상 판매합니다.", location: "고양시 덕양구 화정2동", time: "38분 전", price: 8000, heart: nil, chat: nil, detail: "블랙이구요\n새거입니다\n묶음으로 엄청 싸게 팔아요\n연락주세요")
  ]
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCell")
    homeTableView.separatorInset.left = 0
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
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "transaction" {
      guard let vc: TransactionViewController = segue.destination as? TransactionViewController else { return }
      vc.delegate = self
    }
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
    
    // 셀의 재사용 -> 초기화
    cell.heartCountLabel.text = nil
    cell.heartImageView.isHidden = true
    cell.chatCountLabel.text = nil
    cell.chatImageView.isHidden = true
    
    
    let transaction = transactions[indexPath.row]
    guard let images = transaction.images else { return UITableViewCell() }
    cell.productImageView.image = images[0]
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DetailTransactionViewController()
    
    print(indexPath.row)
    print(transactions[indexPath.row])
    let transaction = transactions[indexPath.row]
//    guard let images = transaction.images else { return }
//    vc.productImageView.image = images[0]
    vc.transaction = transaction
//    vc.locationLabel.text = transaction.location
//    vc.timeLabel.text = transaction.time
//    vc.priceLabel.text = decimalWon(value: transaction.price)
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension HomeViewController: TransactionProtocol {
  func dataSend(productImage: UIImage, title: String, price: Int, detail: String) {
    transactions.insert(TransactionModel(nickname: "제라", images: [productImage], title: title, location: "고양시 일산동구 마두동", time: "1분 전", price: price, heart: nil, chat: nil, detail: detail), at: 0)
    print(transactions)
    homeTableView.reloadData()
  }
}


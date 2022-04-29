//
//  CommunityViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import UIKit

class CommunityViewController: UIViewController {

  @IBOutlet weak var postTableView: UITableView!
  @IBOutlet weak var menuCollectionView: UICollectionView!
  let menuArray = ["동네질문", "동네맛집", "동네소식", "취미생활", "분실/실종센터", "동네사건사고", "해주세요", "일상", "고양이", "강아지", "건강", "살림", "동네사진전", "인테리어", "교육/학원", "출산/육아", "기타"]
  override func viewDidLoad() {
    super.viewDidLoad()
    menuCollectionView.register(UINib(nibName: "CommunityMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "communityMenuCell")
    menuCollectionView.dataSource = self
    menuCollectionView.delegate  = self
    
    //postTableView.register(CommunityPostTableViewCell.self, forCellReuseIdentifier: "postCell")
    postTableView.register(UINib(nibName: "CommunityPostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
    postTableView.separatorInset.left = 0
    postTableView.delegate = self
    postTableView.dataSource = self
  }
    
}

extension CommunityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "communityMenuCell", for: indexPath)
            as? CommunityMenuCollectionViewCell else { return UICollectionViewCell() }
    cell.tagLabel.text = menuArray[indexPath.row]
    return cell
  }
}

extension CommunityViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = postTableView.dequeueReusableCell(withIdentifier: "postCell")
            as? CommunityPostTableViewCell else { return UITableViewCell() }
    
    if indexPath.section != 0 {
      let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 5))
      footer.backgroundColor = UIColor(named:"lightGrayColor")
      cell.contentView.addSubview(footer)
    }
    
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
}

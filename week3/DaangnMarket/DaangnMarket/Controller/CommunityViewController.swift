//
//  CommunityViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import UIKit

class CommunityViewController: UIViewController {

  @IBOutlet weak var menuCollectionView: UICollectionView!
  let menuArray = ["동네질문", "동네맛집", "동네소식", "취미생활", "분실/실종센터", "동네사건사고", "해주세요", "일상", "고양이", "강아지", "건강", "살림", "동네사진전", "인테리어", "교육/학원", "출산/육아", "기타"]
  override func viewDidLoad() {
    super.viewDidLoad()
    menuCollectionView.register(UINib(nibName: "CommunityMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "communityMenuCell")
    //menuCollectionView.register(CommunityMenuCollectionViewCell.self, forCellWithReuseIdentifier: "communityMenuCell")
    menuCollectionView.dataSource = self
    menuCollectionView.delegate  = self
    
  }
    
}

extension CommunityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "communityMenuCell", for: indexPath)
            as? CommunityMenuCollectionViewCell else { return UICollectionViewCell() }
    cell.menuButton.setAttributedTitle(NSAttributedString(string: menuArray[indexPath.row]), for: .normal)
    return cell
  }
}

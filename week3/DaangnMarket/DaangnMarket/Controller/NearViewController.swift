//
//  NearViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class NearViewController: UIViewController {

  @IBOutlet weak var tagCollectionView: UICollectionView!
  @IBOutlet weak var menuCollectionView: UICollectionView!
  
  let tagArray = ["알바", "중고차", "아르바이트", "일자리", "부동산", "전기차", "구인구직", "속눈썹펌", "물고기"]
  let menuArray = ["쿠폰북", "동네장보기", "당근알바", "부동산 직거래", "농수산물", "중고차 직거래", "과외/클래스", "당근미니"]
  let menuNameArray = ["NearMenuImageView1" ,"NearMenuImageView2", "NearMenuImageView3", "NearMenuImageView4",
                      "NearMenuImageView5", "NearMenuImageView6", "NearMenuImageView7", "NearMenuImageView8" ]
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tagCollectionView.register(UINib(nibName: "NearTagCollectionViewCell", bundle: nil),
                               forCellWithReuseIdentifier: "nearTagCell")
    tagCollectionView.delegate = self
    tagCollectionView.dataSource = self
    
    menuCollectionView.register(UINib(nibName: "NearMenuCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "nearButtonCell")
    menuCollectionView.delegate = self
    menuCollectionView.dataSource = self
    
    let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets.zero
    flowLayout.minimumInteritemSpacing = 10
    flowLayout.minimumLineSpacing = 10
    flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width / 4.0 - 20 , height: 80)
    menuCollectionView.collectionViewLayout = flowLayout

        
  }
}

extension NearViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == tagCollectionView {
      return tagArray.count
    }
    else if collectionView == menuCollectionView {
      return 8
    }
    else {
      return 5
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == tagCollectionView {
      guard let cell = tagCollectionView.dequeueReusableCell(withReuseIdentifier: "nearTagCell", for: indexPath)
                      as? NearTagCollectionViewCell else { return UICollectionViewCell() }
      cell.tagTextLabel.text = tagArray[indexPath.row]
      cell.tagTextLabel.sizeToFit()
      return cell
    }
    else if collectionView == menuCollectionView {
      guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "nearButtonCell", for: indexPath)
                      as? NearMenuCollectionViewCell else { return UICollectionViewCell() }
      cell.menuImageView.image = UIImage(named: menuNameArray[indexPath.row])
      cell.menuLabel.text = menuArray[indexPath.row]
      return cell
    }
    else {
      return UICollectionViewCell()
    }
  }
}


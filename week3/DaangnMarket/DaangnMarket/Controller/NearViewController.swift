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
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tagCollectionView.register(UINib(nibName: "NearTagCollectionViewCell", bundle: nil),
                               forCellWithReuseIdentifier: "nearTagCell")
    tagCollectionView.delegate = self
    tagCollectionView.dataSource = self
    
    menuCollectionView.register(UINib(nibName: "NearMenuCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "nearTagCell")
    menuCollectionView.delegate = self
    menuCollectionView.dataSource = self
    

        
  }
}

extension NearViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tagArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = tagCollectionView.dequeueReusableCell(withReuseIdentifier: "nearTagCell", for: indexPath)
                    as? NearTagCollectionViewCell else { return UICollectionViewCell() }
    cell.tagTextLabel.text = tagArray[indexPath.row]
    cell.tagTextLabel.sizeToFit()
    return cell
  }
}


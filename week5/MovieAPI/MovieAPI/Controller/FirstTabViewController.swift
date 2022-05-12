//
//  FirstTabViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit

class FirstTabViewController: UIViewController {

  @IBOutlet weak var adCollectionView: UICollectionView!
  let adImageViewNames: [String] = ["ad1", "ad2"]
  override func viewDidLoad() {
    super.viewDidLoad()
    adCollectionView.dataSource = self
    adCollectionView.delegate = self
      
  }
}


extension FirstTabViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == adCollectionView {
      guard let cell = adCollectionView.dequeueReusableCell(withReuseIdentifier: "adCell", for: indexPath)
              as? ADCollectionViewCell else { return UICollectionViewCell() }
      cell.imgView.image = UIImage(named: adImageViewNames[indexPath.row])
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
}

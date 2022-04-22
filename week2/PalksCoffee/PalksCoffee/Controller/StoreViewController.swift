//
//  StoreViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/21.
//

import UIKit

class StoreViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = false // navigation bar 보여줌
    navigationController?.navigationBar.backItem?.title = ""
    self.definesPresentationContext = true
        
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = false
  }

}

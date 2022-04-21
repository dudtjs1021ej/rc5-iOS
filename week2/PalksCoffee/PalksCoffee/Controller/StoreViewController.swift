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
    navigationController?.navigationBar.barTintColor = .gray
        
  }

  @IBAction func clickedStore(_ sender: Any) {
    let vc = StorePopUpViewController()
    
    vc.modalPresentationStyle = .overCurrentContext
    vc.present(vc, animated: true, completion: nil)
    //self.navigationController?.pushViewController(vc, animated: true)
  }
}

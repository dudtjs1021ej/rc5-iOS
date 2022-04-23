//
//  StorePopUpViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/21.
//

import UIKit

class StorePopUpViewController: UIViewController {

  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var popUpView: UIView!
  override func viewDidLoad() {
    super.viewDidLoad()
    popUpView.layer.cornerRadius = 15
    navigationController?.isNavigationBarHidden = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.isNavigationBarHidden = true
  }

  @IBAction func clickedCancel(_ sender: Any) {
    dismiss(animated: false)
  }
}

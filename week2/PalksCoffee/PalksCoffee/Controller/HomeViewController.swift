//
//  ViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/19.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: Properties

  @IBOutlet weak var menuView: UIView!
  @IBOutlet weak var giftshopView: UIView!
  @IBOutlet weak var smartOrderView: UIView!
  @IBOutlet weak var eventVView: UIView!
  @IBOutlet weak var yogiyoView: UIView!
  
  var popUpCheck: Bool = true
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    menuView.layer.cornerRadius = 10
    giftshopView.layer.cornerRadius = 10
    smartOrderView.layer.cornerRadius = 10
    eventVView.layer.cornerRadius = 10
    yogiyoView.layer.cornerRadius = 10
    
    //UserDefaults.standard.set(true, forKey: "popUp")
  }
  
  // 팝업 창 체크
  override func viewDidAppear(_ animated: Bool) {
    print(UserDefaults.standard.bool(forKey: "popUp"))
    if UserDefaults.standard.bool(forKey: "popUp") == true {
      let popUpVC = PopUpViewController()
      popUpVC.modalPresentationStyle = .overCurrentContext
      self.present(popUpVC, animated: false)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }

  // MARK: - Methods
  
  @IBAction func clickedBarcode(_ sender: Any) {
    let vc = BarcodeViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true)
  }

  @IBAction func clickedSmartorderImage(_ sender: Any) {
    let vc = StoreViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}


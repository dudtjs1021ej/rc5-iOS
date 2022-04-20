//
//  ViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/19.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var menuView: UIView!
  @IBOutlet weak var giftshopView: UIView!
  @IBOutlet weak var smartOrderView: UIView!
  @IBOutlet weak var eventVView: UIView!
  @IBOutlet weak var yogiyoView: UIView!
  
  var popUpCheck: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    menuView.layer.cornerRadius = 10
    giftshopView.layer.cornerRadius = 10
    smartOrderView.layer.cornerRadius = 10
    eventVView.layer.cornerRadius = 10
    yogiyoView.layer.cornerRadius = 10
    
    let popUpVC = PopUpViewController()
    popUpVC.modalPresentationStyle = .overCurrentContext
    self.present(popUpVC, animated: false)
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    if popUpCheck == true {
      let popUpVC = PopUpViewController()
      popUpVC.modalPresentationStyle = .overCurrentContext
      self.present(popUpVC, animated: false)
      popUpCheck = false
    }
    
  }

  @IBAction func clickedBarcode(_ sender: Any) {
    let vc = BarcodeViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true)
  }
  
  func dismissPopUp(animated: Bool) {
    self.dismiss(animated: animated, completion: nil)
  }
  
}

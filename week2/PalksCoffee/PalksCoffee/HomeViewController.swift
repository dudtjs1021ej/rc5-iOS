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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    menuView.layer.cornerRadius = 10
    giftshopView.layer.cornerRadius = 10
    smartOrderView.layer.cornerRadius = 10
    eventVView.layer.cornerRadius = 10
    yogiyoView.layer.cornerRadius = 10
  }


}


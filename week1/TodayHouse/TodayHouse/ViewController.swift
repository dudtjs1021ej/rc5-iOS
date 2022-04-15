//
//  ViewController.swift
//  TodayHouse
//
//  Created by 임영선 on 2022/04/10.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    label.clipsToBounds = true
    label.layer.cornerRadius = 5
  }


}


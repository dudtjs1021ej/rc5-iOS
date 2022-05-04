//
//  ViewController.swift
//  CarrotFarmGame
//
//  Created by 임영선 on 2022/05/03.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func clickedGameStart(_ sender: Any) {
  }
  
  @IBAction func clickedHelp(_ sender: Any) {
    let vc = HelpViewController()
    vc.modalPresentationStyle = .overCurrentContext
    present(vc, animated: true, completion: nil)
  }
}


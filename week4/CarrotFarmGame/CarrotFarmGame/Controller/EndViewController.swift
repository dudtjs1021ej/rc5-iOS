//
//  EndViewController.swift
//  CarrotFarmGame
//
//  Created by 임영선 on 2022/05/04.
//

import UIKit

class EndViewController: UIViewController {

  @IBOutlet weak var resultImageView: UIImageView!
  @IBOutlet weak var scoreLabel: UILabel!
  var score: Int = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    scoreLabel.text = String(score*10)
    resultImageView.layer.cornerRadius = 30
  }
  @IBAction func clickedScore(_ sender: Any) {
    view.window?.rootViewController?.dismiss(animated: false, completion: nil)
  }
}

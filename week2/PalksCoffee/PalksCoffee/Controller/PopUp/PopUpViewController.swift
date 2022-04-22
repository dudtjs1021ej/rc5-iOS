//
//  PopUpViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/20.
//

import UIKit

class PopUpViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = 20
       
    }

  @IBAction func clickedTodayCancelButton(_ sender: Any) {
    UserDefaults.standard.set(false, forKey: "popUp")
    self.dismiss(animated: false, completion: nil)
  }
  
  @IBAction func clickedCancelButton(_ sender: Any) {
    self.dismiss(animated: false, completion: nil)
  }
}

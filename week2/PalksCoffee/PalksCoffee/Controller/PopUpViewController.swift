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
//    let vc = HomeViewController()
//    vc.dismissPopUp(animated: false)
    self.dismiss(animated: false, completion: nil)
  }
  
  @IBAction func clickedCancelButton(_ sender: Any) {
    self.dismiss(animated: false, completion: nil)
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

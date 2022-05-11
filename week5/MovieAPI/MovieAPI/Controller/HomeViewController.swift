//
//  HomeViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit
import KakaoSDKUser

class HomeViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    setUserInfo()
        
    }
  
  func setUserInfo() {
    UserApi.shared.me() { (user, error) in
      if let error = error {
        print(error)
      } else {
        print("me() success")
        _ = user
        self.label.text = user?.kakaoAccount?.profile?.nickname
      }
      
    }
  }

}

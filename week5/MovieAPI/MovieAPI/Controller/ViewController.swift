//
//  ViewController.swift
//  LibraryAPI
//
//  Created by 임영선 on 2022/05/09.
//

import UIKit
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
   
  }

  @IBAction func kakaoLoginTouched(_ sender: UIButton) {
    UserApi.shared.loginWithKakaoAccount(prompts: [.Login]) { (oAuthToken, error) in
      if let error = error {
        print(error)
      } else {
        print("loginWithKakaoAccount success")
        _ = oAuthToken
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
      }
      
    }
  }
  
}


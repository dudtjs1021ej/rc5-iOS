//
//  HomeViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit
import KakaoSDKUser


class HomeViewController: ViewController {
  // MARK: - Properties
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setUserInfo()
        
    }
  
  // MARK: - Methods
  func setUserInfo() {
    UserApi.shared.me() { (user, error) in
      if let error = error {
        print(error)
      } else {
        print("me() success")
        _ = user
      }
    }
  }
  
  
}



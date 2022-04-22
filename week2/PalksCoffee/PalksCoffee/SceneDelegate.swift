//
//  SceneDelegate.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var imageView: UIImageView? // 이미지뷰 생성

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  // 액티브 상태가 됐을 경우 - 이미지뷰 삭제
  func sceneDidBecomeActive(_ scene: UIScene) {
    if let imageView = imageView {
      imageView.removeFromSuperview()
    }
  }

  // Switcher모드 - window에 이미지 추가
  func sceneWillResignActive(_ scene: UIScene) {
    guard let window = window else {
      return
    }
    imageView = UIImageView(frame: window.frame)
    imageView?.image = UIImage(named: "switcher")
    window.addSubview(imageView!)
  }

  // 백그라운드 상태였다가 돌아온 경우
  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  // 백그라운드 상태로 갔을 경우
  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}


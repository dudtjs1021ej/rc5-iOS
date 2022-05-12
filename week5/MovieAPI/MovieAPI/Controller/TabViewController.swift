//
//  TabViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
  private var viewControllers: [UIViewController] = []

  @IBOutlet weak var tabView: UIView!
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabMan()
        
  }
  
  func setTabMan() {
    guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstTabVC")
            as? FirstTabViewController else { return }
    guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondTabVC")
            as? SecondTabViewController else { return }
    viewControllers.append(firstVC)
    viewControllers.append(secondVC)
    
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    
    bar.backgroundView.style = .blur(style: .light)
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    bar.layout.contentMode = .fit
    bar.buttons.customize { button in
      button.tintColor = .white
      button.selectedTintColor = .white
      button.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    bar.indicator.weight = .custom(value: 3)
    bar.indicator.tintColor = .white
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 1, right: 50)
    addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
  }

}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    switch index {
    case 0:
      return TMBarItem(title: "홈")
    case 1:
      return TMBarItem(title: "지도")
    default:
      return TMBarItem(title: "page \(index)")
    }
  }
}

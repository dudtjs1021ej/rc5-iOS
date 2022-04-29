//
//  MyPageViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class SettingsController: UIViewController {

  @IBOutlet weak var settingTableView: UITableView!
  @IBOutlet weak var titleNavigationItem: UINavigationItem!
  let settingNames = [
    ["내 동네 설정", "동네 인증하기", "키워드 알림", "관심카테고리 설정"],
    ["모아보기", "당근가계부", "받은 쿠폰함", "내 단골 가게"],
    ["동네생활 글/댓글", "동네 가게 후기"],
    ["비즈프로필 만들기", "동네홍보 글", "지역광고"],
    ["친구초대", "공지사항", "자주 묻는 질문", "앱 설정"]
  ]
  
  let settingImageNames = [
    ["settingImageView1", "settingImageView2", "settingImageView3", "settingImageView4"],
    ["settingImageView5", "settingImageView6", "settingImageView7", "settingImageView8"],
    ["settingImageView9", "settingImageView10"],
    ["settingImageView11", "settingImageView12", "settingImageView13"],
    ["settingImageView14", "settingImageView15", "settingImageView16", "settingImageView17"]
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "settingCell")
    settingTableView.dataSource = self
    settingTableView.delegate = self
    
//    let identifier = String(describing: SettingHeaderView.self)
//    let nibs = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)
//    guard let customHeaderView = nibs?.first as? SettingHeaderView else { return }
    guard let headerView = Bundle.main.loadNibNamed("SettingHeaderView", owner: self, options: nil)?.first as? SettingHeaderView else { return }
    headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 350)
    settingTableView.tableHeaderView = headerView
  }
}
extension SettingsController: UITableViewDelegate, UITableViewDataSource {
  
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "settingHeaderView")
//            as? SettingHeaderView else { return UIView() }
//    return header
//    
//  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return settingNames.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settingNames[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = settingTableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
            as? SettingTableViewCell else { return UITableViewCell() }
    //cell.backgroundColor = .red
    cell.label.text = settingNames[indexPath.section][indexPath.row]
    cell.settingImageView.image = UIImage(named: settingImageNames[indexPath.section][indexPath.row])
    return cell
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 10
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = UIView()
    header.backgroundColor = UIColor(named: "lightGrayColor")
    return header
  }
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 1
  }
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footer = UIView()
    return footer
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
}

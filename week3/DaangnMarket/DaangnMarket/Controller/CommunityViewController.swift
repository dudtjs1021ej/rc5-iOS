//
//  CommunityViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import UIKit

class CommunityViewController: UIViewController {

  @IBOutlet weak var postTableView: UITableView!
  @IBOutlet weak var menuCollectionView: UICollectionView!
  let menuArray = ["동네질문", "동네맛집", "동네소식", "취미생활", "분실/실종센터", "동네사건사고", "해주세요", "일상", "고양이", "강아지", "건강", "살림", "동네사진전", "인테리어", "교육/학원", "출산/육아", "기타"]
  let posts = [
    PostModel(category: "동네소식", detailText: "마두동에 새로운 와인샵 생겼습니다~~~\n종류도 엄청 많고 가격도 괜찮아요", nickname: "와인좋아", location: "마두동", time: "1분 전"),
    PostModel(category: "동네사건사고", detailText: "혹시 생수 배송된 집 있나요..?\n저희집에 안왔네요ㅠ", nickname: "나야나", location: "동패동", time: "2분 전"),
    PostModel(category: "동네질문", detailText: "Q. 일산쪽에 점빼주는 저렴한 곳 있나요?", nickname: "커피향", location: "탄현동", time: "2분 전"),
    PostModel(category: "동네질문", detailText: "Q. 괜찮게 신발 수선 하는 곳 있나요? ", nickname: "젤리", location: "탄현동", time: "5분 전"),
    PostModel(category: "분실/실종센터", detailText: "안녕하세요! 탄현쪽에서 걸어가는 길에\n지갑 주우신분 ㅠㅠㅠ", nickname: "아아아아아", location: "일산동", time: "10분 전"),
    PostModel(category: "기타", detailText: "여기 광고글 엄청 올라오네요\n 광고 아닌 척해도 다 티나고...", nickname: "주주주", location: "마두동", time: "1시간 전"),
    PostModel(category: "동네맛집", detailText: "일산에서 그릭요거트나 샐러드 맛집 있을까요?? 아니면 스콘같은 디저트도 좋아요", nickname: "러버", location: "덕이동", time: "1시간 전")
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    menuCollectionView.register(UINib(nibName: "CommunityMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "communityMenuCell")
    menuCollectionView.dataSource = self
    menuCollectionView.delegate  = self
    
    //postTableView.register(CommunityPostTableViewCell.self, forCellReuseIdentifier: "postCell")
    postTableView.register(UINib(nibName: "CommunityPostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
    postTableView.separatorInset.left = 0
    postTableView.delegate = self
    postTableView.dataSource = self
  }
    
}

extension CommunityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "communityMenuCell", for: indexPath)
            as? CommunityMenuCollectionViewCell else { return UICollectionViewCell() }
    cell.tagLabel.text = menuArray[indexPath.row]
    return cell
  }
}

extension CommunityViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = postTableView.dequeueReusableCell(withIdentifier: "postCell")
            as? CommunityPostTableViewCell else { return UITableViewCell() }
    
    if indexPath.section != 0 {
      let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 5))
      footer.backgroundColor = UIColor(named:"lightGrayColor")
      cell.contentView.addSubview(footer)
    }
    
    let post = posts[indexPath.section]
    cell.categoryLabel.text = post.category
    cell.postTextView.text = post.detailText
    cell.nicknameLabel.text = post.nickname
    cell.locationLabel.text = post.location
    cell.timeLabel.text = post.time
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
}

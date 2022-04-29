//
//  ChatViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

class ChatViewController: UIViewController {

  @IBOutlet weak var chatTableView: UITableView!
  let chats = [
    ChatModel(profileImage: UIImage(named: "profileImageView1"), nickname: "젤리", location: "마두동", time: "5분 전", chatText: "넵~~", productImage: UIImage(named:"homeImageView2")),
    ChatModel(profileImage: nil, nickname: "프레즐", location: "동패동", time: "10분 전", chatText: "좋은 하루 되세요!!", productImage: nil),
    ChatModel(profileImage: nil, nickname: "aaka", location: "화양동", time: "1달 전", chatText: "앗 넹", productImage: UIImage(named:"homeImageView1")),
    ChatModel(profileImage: UIImage(named: "profileImageView2"), nickname: "감자", location: "운정3동", time: "1달 전", chatText: "도착하면 말해주세요", productImage: nil),
    ChatModel(profileImage: nil, nickname: "헤이", location: "역삼동", time: "1달 전", chatText: "네 알겠습니다~", productImage: nil),
    ChatModel(profileImage: nil, nickname: "예가", location: "야당동", time: "1달 전", chatText: "네네~~", productImage: UIImage(named:"homeImageView3")),
    ChatModel(profileImage: UIImage(named: "profileImageView3"), nickname: "yummm", location: "마두동", time: "2달 전", chatText: "네 ㅠㅠ", productImage: nil),
    ChatModel(profileImage: nil, nickname: "ttsasd", location: "옥정동", time: "2달 전", chatText: "감사합니다🙂", productImage: nil),
    ChatModel(profileImage: nil, nickname: "티라미슈", location: "동패동", time: "2달 전", chatText: "넵!!", productImage: nil),
    ChatModel(profileImage: nil, nickname: "캔디", location: "송도동", time: "3달 전", chatText: "아ㅠㅠㅠ", productImage: nil)
    
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    chatTableView.separatorInset.left = 0
    chatTableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "chatCell")
    chatTableView.delegate = self
    chatTableView.dataSource = self
       
  }

}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chats.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = chatTableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)
            as? ChatTableViewCell else { return UITableViewCell() }
    cell.chatLabel.text = chats[indexPath.row].chatText
    cell.locationLabel.text = chats[indexPath.row].location
    cell.nickNameLabel.text = chats[indexPath.row].nickname
    cell.timeLabel.text = chats[indexPath.row].time
    
    if let productImage = chats[indexPath.row].productImage {
      cell.productImageView.image = productImage
    }
    
    if let profileImage = chats[indexPath.row].profileImage {
      cell.profileImageView.image = profileImage
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 93
  }
  
}

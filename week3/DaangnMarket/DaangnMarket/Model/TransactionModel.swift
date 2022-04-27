//
//  Transaction.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/28.
//

import Foundation
import UIKit
struct TransactionModel {
  let images: [UIImage]
  let title: String
  let location: String
  let time: String
  let price: Int
  let heart: Int?
  let chat: Int?
  let detail: String
}

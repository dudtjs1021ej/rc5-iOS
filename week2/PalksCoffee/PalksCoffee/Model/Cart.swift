//
//  CartModel.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import Foundation
class Cart {
  static let shared = Cart()
  var menu: [String] = []
  var price: [Int] = []
  var option: [Int] = []
  var count: [Int] = []
  var imageName: [String] = []
}

//
//  DashedLineView.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import Foundation
import UIKit

class DashedLineView: UIView {

    private let borderLayer = CAShapeLayer()

    override func awakeFromNib() {
      super.awakeFromNib()
      borderLayer.strokeColor = UIColor(named: "DashedColor")?.cgColor
      borderLayer.lineDashPattern = [5,5]
      borderLayer.backgroundColor = UIColor.clear.cgColor
      borderLayer.fillColor = UIColor.clear.cgColor
      layer.addSublayer(borderLayer)
    }
    override func draw(_ rect: CGRect) {
      borderLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 8).cgPath
    }
}

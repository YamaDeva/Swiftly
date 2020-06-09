//
//  SetLayout.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension UIView {

  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 10, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  func setBorder(color: UIColor, width: CGFloat, cornerRadius: CGFloat = 0) {
    layer.borderWidth = width
    layer.borderColor = color.cgColor
    layer.masksToBounds = true
    layer.cornerRadius = cornerRadius
  }

  func roundRectCorners(corners: UIRectCorner, radius: CGFloat, withBorder: (UIColor,CGFloat)? = nil) {
    let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
    layer.masksToBounds = true

    guard let withBorder = withBorder else {return}

    let borderLayer = CAShapeLayer()
    borderLayer.path = mask.path // Reuse the Bezier path
    borderLayer.fillColor = UIColor.clear.cgColor
    borderLayer.strokeColor = withBorder.0.cgColor
    borderLayer.lineWidth = withBorder.1
    borderLayer.frame = self.bounds
    self.layer.addSublayer(borderLayer)
  }

  func drawDottedLine(start p0: CGPoint, end p1: CGPoint, dash: NSNumber, gap: NSNumber, color: UIColor) {
    let shapeLayer = CAShapeLayer()
    shapeLayer.strokeColor = color.cgColor
    shapeLayer.lineWidth = 1
    shapeLayer.lineDashPattern = [dash, gap]
    let path = CGMutablePath()
    path.addLines(between: [p0, p1])
    shapeLayer.path = path
    self.layer.addSublayer(shapeLayer)
  }

}

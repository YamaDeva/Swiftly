//
//  File.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension UIView {

  func setBackgroundColor(with gradient: Gradient) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [gradient.secondColor.cgColor, gradient.firstColor.cgColor]
    gradientLayer.startPoint = gradient.direction.start
    gradientLayer.endPoint = gradient.direction.end
    gradientLayer.frame = bounds
    layer.insertSublayer(gradientLayer, at: 0)
  }

}

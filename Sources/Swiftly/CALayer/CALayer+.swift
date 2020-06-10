//
//  CALayer+.swift
//  
//
//  Created by Martina D'urso on 10/06/2020.
//

import UIKit

public extension CALayer {

  func animateBorderColor(from startColor: UIColor, to endColor: UIColor, withDuration duration: Double) {
    let colorAnimation = CABasicAnimation(keyPath: "borderColor")
    colorAnimation.fromValue = startColor.cgColor
    colorAnimation.toValue = endColor.cgColor
    colorAnimation.duration = duration
    self.borderColor = endColor.cgColor
    self.add(colorAnimation, forKey: "borderColor")
  }

}

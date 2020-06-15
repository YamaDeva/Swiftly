//
//  SetCorner.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension UIImageView {
  func setCorner(radius to: CGFloat = 8.0) {
    self.layer.cornerRadius = to
    self.layer.masksToBounds = true
  }
}

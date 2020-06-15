//
//  UILabel+.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension UILabel {

  func addSpacing(characterSpacing: CGFloat) {
    let attributedString = NSMutableAttributedString(attributedString: self.attributedText!)
    attributedString.addAttribute(NSAttributedString.Key.kern,
                                  value: characterSpacing,
                                  range: NSRange(location: 0, length: attributedString.length))
    self.attributedText = attributedString
  }

}

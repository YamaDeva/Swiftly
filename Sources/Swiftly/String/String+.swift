//
//  String+.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension String {

  var localized: String {
    NSLocalizedString(self, comment: "")
  }

  func capitalizingFirstLetter() -> String {
    return prefix(1).uppercased() + self.lowercased().dropFirst()
  }

  mutating func capitalizeFirstLetter() {
    self = self.capitalizingFirstLetter()
  }

  func lineSpaced(_ spacing: CGFloat) -> NSAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = spacing
    let attributedString = NSAttributedString(string: self.htmlToString, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    return attributedString
  }

}

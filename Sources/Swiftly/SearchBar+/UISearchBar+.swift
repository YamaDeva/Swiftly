//
//  UISearchBar+.swift
//  
//
//  Created by Martina D'urso on 15/06/2020.
//

import UIKit

public extension UISearchBar {

  func getTextField() -> UITextField? {
    return value(forKey: "searchField") as? UITextField
  }

  func set(textColor: UIColor) {
    if let textField = getTextField() {
      textField.textColor = textColor
    }
  }

  func setPlaceholder(color: UIColor) {
    getTextField()?.setPlaceholder(color: color)
  }

  func setClearButton(color: UIColor) {
    getTextField()?.setClearButton(color: color)
  }

  func setTextField(color: UIColor, radius: CGFloat = 6) {
    guard let textField = getTextField() else { return }
    switch searchBarStyle {
    case .minimal:
      textField.layer.backgroundColor = color.cgColor
      textField.layer.cornerRadius = radius
    case .prominent, .default:
      textField.backgroundColor = color
    @unknown default:
      break
    }
  }

  func setSearchImage(color: UIColor) {
    guard let imageView = getTextField()?.leftView as? UIImageView else { return }
    imageView.tintColor = color
    imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
  }
}


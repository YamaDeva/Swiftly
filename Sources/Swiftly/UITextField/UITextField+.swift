//
//  UITextField+.swift
//  
//
//  Created by Martina D'urso on 10/06/2020.
//

import UIKit

public extension UITextField {

  func setLeftPadding(to points: CGFloat){
    let padding = UIView(frame: CGRect(x: 0, y: 0, width: points, height: self.frame.size.height))
    self.leftView = padding
    self.leftViewMode = .always
  }

  func setRightPadding(to points: CGFloat) {
    let padding = UIView(frame: CGRect(x: 0, y: 0, width: points, height: self.frame.size.height))
    self.rightView = padding
    self.rightViewMode = .always
  }
}

public extension UITextField {

  private class Label: UILabel {

    init(label: UILabel, textColor: UIColor = .lightGray) {
      super.init(frame: label.frame)
      self.text = label.text
      self.font = label.font
      self.textColor = textColor
    }

    required init?(coder: NSCoder) { super.init(coder: coder) }
  }


  private class ClearButton {

    static private var image: UIImage?

    static private let semaphore = DispatchSemaphore(value: 1)

    static func getImage(closure: @escaping (UIImage?)->()) {
      DispatchQueue.global(qos: .userInteractive).async {
        semaphore.wait()
        DispatchQueue.main.async {
          if let image = image {
            closure(image)
            semaphore.signal()
            return
          }
          guard let window = UIApplication.shared.windows.first else {
            semaphore.signal()
            return
          }
          let searchBar = UISearchBar(frame: CGRect(x: 0,
                                                    y: -200,
                                                    width: UIScreen.main.bounds.width,
                                                    height: 44))
          window.rootViewController?.view.addSubview(searchBar)
          searchBar.text = "text"
          searchBar.layoutIfNeeded()
          image = searchBar.getTextField()?.getClearButton()?.image(for: .normal)
          closure(image)
          searchBar.removeFromSuperview()
          semaphore.signal()
        }
      }
    }

  }

  var placeholderLabel: UILabel? {
    return value(forKey: "placeholderLabel") as? UILabel
  }

  func setClearButton(color: UIColor) {
    ClearButton.getImage { [weak self] image in
      guard let image = image,
        let button = self?.getClearButton() else { return }
      button.imageView?.tintColor = color
      button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
    }
  }

  func setPlaceholder(color: UIColor) {
    guard let placeholderLabel = placeholderLabel else { return }
    let label = Label(label: placeholderLabel, textColor: color)
    setValue(label, forKey: "placeholderLabel")
  }

  func getClearButton() -> UIButton? {
    return value(forKey: "clearButton") as? UIButton
  }

}



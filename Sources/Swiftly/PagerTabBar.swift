//
//  PagerTabBar.swift
//  
//
//  Created by Martina D'urso on 15/06/2020.
//

import UIKit

public protocol PageSelector {
  func didSelect(page: Int)
}

public class PagerTabBar: UIView, UIScrollViewDelegate {

  private let _lineView = UIView()
  private var lineViewHeight: CGFloat?
  private var arrayButton: [UIButton] = []
  var buttonAttributes: (selected: [NSAttributedString.Key: Any],
    default: [NSAttributedString.Key: Any]) = (selected: [:],
                                               default: [:])
  var lineView: (height: CGFloat, color: UIColor) = (height: 3, color: .white)
  var delegate: PageSelector?

  var selectedPage = Int() {
    didSet {
      selectPageByScroll()
    }
  }

  var pages = [String]() {
    didSet {
      setPage()
    }
  }

  func setPage() {
    let pageWidth = self.frame.size.width / CGFloat(pages.count)
    for (index, _) in pages.enumerated() {
      let button = UIButton(type: .custom)
      button.frame = CGRect(x: pageWidth * CGFloat(index), y: 0, width: pageWidth, height: self.frame.height)
      button.apply(title: button.titleLabel!.text!,
                   attributes: (index == 0) ? buttonAttributes.selected : buttonAttributes.default)
      button.tag = index
      button.addTarget(self, action: #selector(selectPage(_:)), for: .touchUpInside)
      arrayButton.append(button)
      self.addSubview(button)
    }

    _lineView.frame = CGRect(x: 0, y: self.frame.maxY - lineView.height, width: pageWidth, height: lineView.height)
    _lineView.backgroundColor = lineView.color
    self.addSubview(_lineView)

  }

  @IBAction func selectPage(_ sender: UIButton) {
    delegate?.didSelect(page: sender.tag)
    arrayButton.forEach({ (button) in
      button.apply(title: button.titleLabel!.text!,
                   attributes: (button.tag != sender.tag) ? buttonAttributes.default : buttonAttributes.selected)
    })
    let pageWidth = self.frame.size.width / CGFloat(pages.count)
    UIView.animate(withDuration: 0.25) {
      self._lineView.frame.origin.x = (pageWidth * CGFloat(sender.tag))
    }
  }

  func selectPageByScroll() {
    arrayButton.forEach({ (button) in
      button.apply(title: button.titleLabel!.text!,
                   attributes: (button.tag != selectedPage) ? buttonAttributes.default : buttonAttributes.selected)
      let pageWidth = self.frame.size.width / CGFloat(pages.count)
      UIView.animate(withDuration: 0.25) {
        self._lineView.frame.origin.x = (pageWidth * CGFloat(self.selectedPage))
      }
    })
  }
}

extension UIButton {
  func apply(title: String, attributes: [NSAttributedString.Key: Any]) {
    let attributedString = NSAttributedString(string: title, attributes: attributes)
    self.setAttributedTitle(attributedString, for: .normal)
  }
}
//
//  File.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension UIViewController {

  func setClearNavigation() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.view.backgroundColor = UIColor.clear
  }

  func setupNavigation(title: String? = nil, colorTitle: UIColor = .white, fontName: String = "HelveticaNeue-UltraLight", fontSize: CGFloat = 20 ,  barTintColor: UIColor, imageName: String = "") {
    self.navigationController?.navigationBar.barTintColor = barTintColor
    self.navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.titleTextAttributes = [
      .font: UIFont(name: fontName, size: fontSize)!,
      .foregroundColor: colorTitle
    ]
    self.navigationItem.title = title
    if imageName != ""{
      let logo = UIImage(named: imageName)
      let imageView = UIImageView(image: logo)
      self.navigationItem.titleView = imageView
    }
  }

  func setupLeftTitle(title: String, font: UIFont, color: UIColor = .black) {
    let button = UIButton(type: .custom)
    let dict1: [NSAttributedString.Key: Any] =  [
      .font: font,
      .foregroundColor: color
    ]
    let attString = NSMutableAttributedString()
    attString.append(NSAttributedString(string: title, attributes: dict1))
    button.setAttributedTitle(attString, for: .normal)
    let barButton = UIBarButtonItem(customView: button)
    navigationItem.leftBarButtonItems = [barButton]
  }

  func setupRightTitle(title: String, font: UIFont, color: UIColor = .black) {
    let button = UIButton(type: .custom)
    let dict1: [NSAttributedString.Key: Any] =  [
      .font: font,
      .foregroundColor: color
    ]
    let attString = NSMutableAttributedString()
    attString.append(NSAttributedString(string: title, attributes: dict1))
    button.setAttributedTitle(attString, for: .normal)
    let barButton = UIBarButtonItem(customView: button)
    navigationItem.rightBarButtonItems = [barButton]
  }

  func setupRightButton(target: Any, action: Selector, imageName: String, size: CGSize =  CGSize(width:25, height:22)) {
    let button = UIButton(type: .custom)
    let imageButton = UIImage(named: imageName)
    button.setImage(imageButton, for: UIControl.State.normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.addTarget(target, action: action, for: .touchUpInside)
    button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    button.contentVerticalAlignment = .fill
    button.contentHorizontalAlignment = .fill
    let barButton = UIBarButtonItem(customView: button)
    navigationItem.rightBarButtonItems = [barButton]
  }


  func setupRightImage(imageName: String, size: CGSize =  CGSize(width:25, height:22)) {
    let button = UIButton(type: .custom)
    let imageButton = UIImage(named: imageName)
    button.setImage(imageButton, for: UIControl.State.normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    button.contentVerticalAlignment = .fill
    button.contentHorizontalAlignment = .fill
    let barButton = UIBarButtonItem(customView: button)
    navigationItem.rightBarButtonItems = [barButton]
  }


  func setupLeftButton(target: Any, action: Selector, imageName: String, size: CGSize =  CGSize(width:25, height:22)) {
    let button = UIButton(type: .custom)
    let imageButton = UIImage(named: imageName)
    button.setImage(imageButton, for: UIControl.State.normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.addTarget(target, action: action, for: .touchUpInside)
    button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    button.contentVerticalAlignment = .fill
    button.contentHorizontalAlignment = .fill
    let barButton = UIBarButtonItem(customView: button)
    navigationItem.leftBarButtonItems = [barButton]
  }

  func removeLeftButton() {
    navigationController?.navigationBar.topItem?.leftBarButtonItems = nil
  }

}

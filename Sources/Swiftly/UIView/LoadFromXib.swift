//
//  LoadFromXib.swift
//  
//
//  Created by Martina D'urso on 10/06/2020.
//

import UIKit

public extension UIView {

  static func loadFromXib(with owner: UIView) -> UIView {
    let bundle = Bundle(for: self)
    let nib = UINib(nibName: "\(self)", bundle: bundle)
    guard let view = nib.instantiate(withOwner: owner).first as? UIView else {
      fatalError("Errore nel caricamento del nib \(self).xib")
    }
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    view.frame = owner.bounds
    return view
  }

}

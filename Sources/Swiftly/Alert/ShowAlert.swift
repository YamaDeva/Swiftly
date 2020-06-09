//
//  ShowAlert.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension UIViewController {

  func showAlert(title: String, message: String, firstAction: String? = "Ok", secondAction: String? = "Cancel", withCancelButton: Bool, onOkDismiss: (() -> Void)? = nil, onCancelDismiss: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: firstAction, style: .default, handler: { (action: UIAlertAction!) in
        onOkDismiss?()
      }))
      if withCancelButton {
        alert.addAction(UIAlertAction(title: secondAction, style: .cancel, handler: { (action: UIAlertAction!) in
          onCancelDismiss?()
        }))
      }

      self.present(alert, animated: true, completion: nil)
    }
  }
}

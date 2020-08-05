//
//  Loader..swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public class Loader {

  private static var vSpinner : UIView?

  static private let semaphore = DispatchSemaphore(value: 1)

  public static var state: Bool {
    vSpinner != nil
  }

  public static func start(backgroundIndicatorColor: UIColor = .clear, indicatorColor: UIColor = .darkGray, backgroundColor: UIColor = .white, view: UIView, viewColor: UIColor = .clear) {
    semaphore.wait()
    if vSpinner == nil {
      let spinnerView = UIView.init(frame: view.bounds)
      spinnerView.backgroundColor = viewColor
      let backView: UIView = UIView(frame: CGRect(x: spinnerView.center.x - 50, y: spinnerView.center.y - 50, width: 100, height: 100))
      backView.center = spinnerView.center
      backView.layer.cornerRadius = 6.0
      backView.backgroundColor = backgroundColor
      backView.dropShadow(color: .lightGray, offSet: CGSize(width: 2, height: 2))
      let ai = UIActivityIndicatorView.init(style: .whiteLarge)
      ai.backgroundColor = backgroundIndicatorColor
      ai.color = indicatorColor
      ai.startAnimating()
      ai.center = spinnerView.center

      DispatchQueue.main.async {
        spinnerView.addSubview(backView)
        spinnerView.addSubview(ai)
        view.addSubview(spinnerView)
      }
      vSpinner = spinnerView
    }
  }

  public static func stop() {
    DispatchQueue.main.async {
      vSpinner?.removeFromSuperview()
      vSpinner = nil
      semaphore.signal()
    }
  }
}


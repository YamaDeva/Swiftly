//
//  DownloadImage.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

public extension UIImageView {

  func loadImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    contentMode = mode
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }

  func loadFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    guard let url = URL(string: link) else { return }
    loadImage(from: url, contentMode: mode)
  }

  func downloadImage(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    let cacheID = NSString(string: link)

    if let cachedData = imageCache.object(forKey: cacheID) as? UIImage {
      self.image = cachedData
      return
    }
    guard let url = URL(string: link) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, _) in
      DispatchQueue.main.async { [weak self] in
        if let data = data, let imageToCache = UIImage(data: data) {
          imageCache.setObject(imageToCache, forKey: cacheID)
          self?.contentMode = mode
          self?.image = imageToCache
        }
      }
    }.resume()
  }

}

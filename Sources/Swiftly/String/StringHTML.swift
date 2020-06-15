//
//  StringHTML.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public extension String {

  var htmlToAttributedString: NSAttributedString? {
    guard let data = data(using: .utf8) else { return NSAttributedString() }
    do {
      return try NSAttributedString(data: data,
                                    options: [.documentType: NSAttributedString.DocumentType.html,
                                              .characterEncoding:String.Encoding.utf8.rawValue],
                                    documentAttributes: nil)
    } catch {
      return NSAttributedString()
    }
  }

  var htmlToString: String {
    return htmlToAttributedString?.string ?? ""
  }

  var setHTMLFromString: String {
    return appendingFormat("<style>body{line-height: 1.8em; font-size: 11pt} </style>")
  }

}


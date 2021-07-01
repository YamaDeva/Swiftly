//
//  Chunk.swift
//  
//
//  Created by Martina D'urso on 01/07/21.
//

import Foundation

extension String {
  func chunkFormatted(withChunkSize chunkSize: Int = 4,
                      withSeparator separator: Character = " ") -> String {
    return self.filter { $0 != separator }.chunk(n: chunkSize)
      .map{ String($0) }.joined(separator: String(separator))
  }
}

extension Collection {
  public func chunk(n: Int) -> [SubSequence] {
    var res: [SubSequence] = []
    var i = startIndex
    var j: Index
    while i != endIndex {
      j = index(i, offsetBy: n, limitedBy: endIndex) ?? endIndex
      res.append(self[i..<j])
      i = j
    }
    return res
  }
}

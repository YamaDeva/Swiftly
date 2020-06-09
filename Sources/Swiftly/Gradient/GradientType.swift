//
//  GradientType.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

public enum GradientType {
  case leftRight
  case rightLeft
  case topBottom
  case bottomTop
  case topLeftBottomRight
  case bottomRightTopLeft
  case topRightBottomLeft
  case bottomLeftTopRight

  public var start: CGPoint {
    switch self {
    case .leftRight: return CGPoint(x: 0, y: 0.5)
    case .rightLeft: return CGPoint(x: 1, y: 0.5)
    case .topBottom: return CGPoint(x: 0.5, y: 0)
    case .bottomTop: return CGPoint(x: 0.5, y: 1)
    case .topLeftBottomRight: return CGPoint(x: 0, y: 0)
    case .bottomRightTopLeft: return CGPoint(x: 1, y: 1)
    case .topRightBottomLeft: return CGPoint(x: 1, y: 0)
    case .bottomLeftTopRight: return CGPoint(x: 0, y: 1)
    }
  }

  public var end: CGPoint {
    switch self {
    case .leftRight: return CGPoint(x: 1, y: 0.5)
    case .rightLeft: return CGPoint(x: 0, y: 0.5)
    case .topBottom: return CGPoint(x: 0.5, y: 1)
    case .bottomTop: return CGPoint(x: 0.5, y: 0)
    case .topLeftBottomRight: return CGPoint(x: 1, y: 1)
    case .bottomRightTopLeft: return CGPoint(x: 0, y: 0)
    case .topRightBottomLeft: return CGPoint(x: 0, y: 1)
    case .bottomLeftTopRight: return CGPoint(x: 1, y: 0)
    }
  }
}

//
//  File.swift
//  
//
//  Created by Martina D'urso on 09/06/2020.
//

import UIKit

open class Gradient {

  public let firstColor: UIColor
  public let secondColor: UIColor
  public let direction: GradientType

  public init(firstColor: UIColor, secondColor: UIColor, direction: GradientType) {
    self.firstColor = firstColor
    self.secondColor = secondColor
    self.direction = direction
  }
}

//
//  UIButton.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import UIKit

extension UIButton {
    func addCornerRadius() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
    }
    
    func addShadow() {
          self.layer.shadowOffset = CGSize(width: 1, height: 1)
          self.layer.shadowOpacity = 0.8
          self.layer.shadowRadius = 2
          self.layer.shadowColor = UIColor.black.cgColor
      }
}

extension UIImageView {
    func addShadow() {
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
      }
}

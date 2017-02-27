//
//  Generic.swift
//  HitList
//
//  Created by Appinventiv on 25/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  var getTableViewCell : UITableViewCell?{
    
    var cell = self
    while !(cell is UITableViewCell) {
      
      guard let s = cell.superview else {return nil}
      cell = s
      
    }
    return cell  as? UITableViewCell   }
}

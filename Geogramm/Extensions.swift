//
//  Extensions.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate<T: BaseView>() -> T? {
    let identifier = String(describing: self)
    return UIStoryboard(name: T.storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T
  }
}

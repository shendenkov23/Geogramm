//
//  BaseView.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import UIKit

protocol BaseView where Self: UIViewController {
  static var storyboardName: String { get }
}

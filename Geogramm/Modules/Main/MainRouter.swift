//
//  MainRouter.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import Foundation
import SwinjectStoryboard

protocol MainRouter {
  func toAddPoint()
}

class MainRouterImplementation {
  private weak var view: MainViewController?
  
  // MARK: -
  
  init(view: MainViewController) {
    self.view = view
  }
}

extension MainRouterImplementation: MainRouter {
  func toAddPoint() {
    guard let controller: AddPointViewController = .instantiate() else { return }
    view?.navigationController?.pushViewController(controller, animated: true)
  }
}

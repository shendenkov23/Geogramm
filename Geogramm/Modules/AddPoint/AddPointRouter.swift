//
//  AddPointRouter.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import Foundation

protocol AddPointRouter {
  func back()
}

class AddPointRouterImplementation {
  private weak var view: AddPointViewController?
  
  // MARK: -
  
  init(view: AddPointViewController) {
    self.view = view
  }
}

extension AddPointRouterImplementation: AddPointRouter {
  func back() {
    view?.navigationController?.popViewController(animated: true)
  }
}

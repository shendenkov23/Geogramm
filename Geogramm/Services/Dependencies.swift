//
//  Dependencies.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
  public static func setup() {
    defaultContainer.register(CoreDataService.self, factory: { _ in CoreDataService() })
    
    defaultContainer.storyboardInitCompleted(MainViewController.self) { resolver, controller in
      controller.router = MainRouterImplementation(view: controller)
      controller.coreDataService = resolver.resolve(CoreDataService.self)
    }
    
    defaultContainer.storyboardInitCompleted(AddPointViewController.self) { resolver, controller in
      controller.router = AddPointRouterImplementation(view: controller)
      controller.coreDataService = resolver.resolve(CoreDataService.self)
    }
  }
}

class DependencyInjector {
  // MARK: -
  
  static let shared = DependencyInjector()
  private init() {}
  
  // MARK: -
  
  
  
}

//
//  AppDelegate.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import GoogleMaps
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    configureGoogleMaps()
    
    return true
  }
  
  // MARK: -
  
  private func configureGoogleMaps() {
    GMSServices.provideAPIKey(kGOOGLE_MAPS_API_KEY)
  }
}

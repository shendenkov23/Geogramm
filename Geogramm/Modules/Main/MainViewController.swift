//
//  MainViewController.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import UIKit
import GoogleMaps

class MainViewController: UIViewController {
  var router: MainRouter?
  var coreDataService: CoreDataService?
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var mapView: GMSMapView!
  
  // MARK: -
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addPoints()
  }
  
  private func addPoints() {
    let points = coreDataService?.fetchPoints()

    points?.forEach({ [weak self] in
      let marker = GMSMarker()
      marker.position = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
      marker.title = $0.title
      marker.snippet = $0.tag
      marker.map = self?.mapView
    })
  }

  // MARK: - Actions

  @IBAction private func btnAddPlacePressed(_ sender: UIButton) {
    router?.toAddPoint()
  }
}

// MARK: - BaseView

extension MainViewController: BaseView {
  static var storyboardName: String {
    return "Main"
  }
}

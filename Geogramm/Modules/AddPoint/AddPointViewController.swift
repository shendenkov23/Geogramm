//
//  AddPointViewController.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import UIKit
import GoogleMaps

class AddPointViewController: UIViewController {
  var router: AddPointRouter?
  var coreDataService: CoreDataService?
  
  // MARK: -
  
  @IBOutlet private weak var mapView: GMSMapView!
  @IBOutlet private weak var txtTitle: UITextField!
  @IBOutlet private weak var txtTag: UITextField!
  
  // MARK: -
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Actions
  
  @IBAction private func btnCancelPressed(_ sender: UIButton) {
    router?.back()
  }
  
  @IBAction private func btnDonePressed(_ sender: UIButton) {
    guard let title = txtTitle.text, !title.isEmpty else {
      let alert = UIAlertController(title: Literal.Alert.Title.error,
                                    message: Literal.Alert.Message.emptyTitle,
                                    preferredStyle: .alert)
      present(alert, animated: true, completion: nil)
      return
    }
    
    let coords = mapView.camera.target
    coreDataService?.savePoint(title: title, tag: txtTag.text,
                               latitude: coords.latitude,
                               longitude: coords.longitude)
    router?.back()
  }
}

// MARK: - BaseView

extension AddPointViewController: BaseView {
  static var storyboardName: String {
    return "Main"
  }
}

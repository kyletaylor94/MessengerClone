//
//  AlertService.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 24/02/2024.
//

import Foundation
import UIKit
import SwiftUI

class AlertService {
    func createAlert(title: String, message: String, presentingViewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dimiss", style: .cancel)
        alert.addAction(dismissAction)
        DispatchQueue.main.async {
            presentingViewController.present(alert, animated: true)
        }
    }
}


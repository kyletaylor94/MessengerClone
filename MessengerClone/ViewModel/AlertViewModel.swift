//
//  AlertViewModel.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 24/02/2024.
//

import Foundation
import UIKit

class AlertViewModel{
    let alertService = AlertService()
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                self.alertService.createAlert(title: title, message: message, presentingViewController: rootViewController)
            }
        }
    }
}

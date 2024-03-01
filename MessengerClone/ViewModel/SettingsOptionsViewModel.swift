//
//  SettingsOptionsViewModel.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import Foundation
import SwiftUI

enum ProfileImageComponent: Int, CaseIterable, Identifiable {
    case darkmode
    case status
    case accessibility
    case privacy
    case notifications
    
    var id: Int { return self.rawValue}
    
    var imageName: String {
        switch self {
        case .darkmode:
            return "moon.circle.fill"
        case .status:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    
    var titleName: String {
        switch self {
        case .darkmode:
            return "Dark Mode"
        case .status:
            return "Active status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy and Safety"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageColor: Color {
        switch self {
        case .darkmode:
            return .black
        case .status:
            return .green
        case .accessibility:
            return .black
        case .privacy:
            return .blue
        case .notifications:
            return .purple
        }
    }
}

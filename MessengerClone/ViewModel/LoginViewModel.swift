//
//  LoginViewModel.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 24/02/2024.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}

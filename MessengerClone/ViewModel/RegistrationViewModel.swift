//
//  RegistrationViewModel.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 24/02/2024.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var imageProfile: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
    
}

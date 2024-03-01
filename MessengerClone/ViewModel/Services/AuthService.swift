//
//  AuthService.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 24/02/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class AuthService{
    @Published var userSession: Firebase.User?
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.loadCurrentUserData()
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            self.loadCurrentUserData()
        } catch {
            print("DEBUG: FAILED TO SIGN IN USER WITH THIS ERROR: \(error.localizedDescription)")
            AlertViewModel().showAlert(title: "Error! Failed to SIGN IN the user:", message: error.localizedDescription)
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            self.loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
            AlertViewModel().showAlert(title: "Error! Failed to create user:", message: error.localizedDescription)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch{
            print("DEBUG: FAILED TO SIGNOUT.:\(error.localizedDescription)")
            AlertViewModel().showAlert(title: "Error!", message: error.localizedDescription)
        }
    }
    
    @MainActor
    func deleteUserData() {
        guard let user = Auth.auth().currentUser else { return }
        
        do {
             Firestore.firestore().collection("users").document(user.uid).delete()
             deleteUserAuth(user: user)
        } catch{
            print(error.localizedDescription)
            AlertViewModel().showAlert(title: "Error!", message: error.localizedDescription)
        }
    }
    
    @MainActor
    func deleteUserAuth(user: Firebase.User) {
        user.delete { error in
          if let error = error{
              print("CANNOT DELETE USER: \(error.localizedDescription)")
              AlertViewModel().showAlert(title: "Error!", message: error.localizedDescription)
          } else {
              print("USER AUTH DELETED SUCCESSFULLY")
              self.userSession = nil
              UserService.shared.currentUser = nil
          }
      }
    }
    
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUserData(){
        Task { try await UserService.shared.fetchCurrentUser() }
    }
}




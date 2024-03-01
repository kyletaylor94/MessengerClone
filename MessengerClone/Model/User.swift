//
//  User.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String{
        return uid ?? NSUUID().uuidString
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}

extension User{
    static let MOCK_USER = User(fullname: "Bruce wayne", email: "batman@gmail.com",profileImageUrl: "download")
}

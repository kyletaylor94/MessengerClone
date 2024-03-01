//
//  Constants.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 01/03/2024.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}

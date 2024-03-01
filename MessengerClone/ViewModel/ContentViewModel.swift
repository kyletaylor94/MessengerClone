//
//  ContentViewModel.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 01/03/2024.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}

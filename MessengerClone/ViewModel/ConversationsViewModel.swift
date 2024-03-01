//
//  ConversationsViewModel.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 01/03/2024.
//

import Foundation
import Combine
import Firebase

class ConversationsViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    
    private var cancellables = Set<AnyCancellable>()
    private let service = ConversationService()
    
    init(){
        setupSubscribers()
        service.observeRecentMessages()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]){
        var messages = changes.compactMap ({ try? $0.document.data(as: Message.self) })
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            let messageExist = self.recentMessages.contains { $0.chatPartnerId == message.chatPartnerId }
            
            if !messageExist {
                UserService.fetchUser(withUid: message.chatPartnerId) { user in
                    messages[i].user = user
                    self.recentMessages.append(messages[i])
                }
            }
        }
    }
    
}

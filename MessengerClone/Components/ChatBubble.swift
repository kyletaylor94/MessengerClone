//
//  ChatBubble.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 06/02/2024.
//

import SwiftUI

struct ChatBubble: Shape {
    let message: Message
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight, message.isFromCurrentUser ? .bottomLeft : .bottomRight],
            cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(message: .init(fromId: "asd", toId: "dsa", messageText: "Hello ", timestamp: .init(date: Date())))
}

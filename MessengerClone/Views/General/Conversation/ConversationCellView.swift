//
//  ConversationCellView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI
import Firebase

struct ConversationCellView: View {
    let recentMessage: Message

    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                CircularProfieImageView(user: recentMessage.user, size: .medium)
                
                VStack(alignment: .leading, spacing: 4){
                    
                    Text(recentMessage.user?.fullname ?? "")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    
                    Text(recentMessage.messageText)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
                }
                HStack{
                    Text(convertTimeStamp(date: recentMessage.timestamp))
                    Image(systemName: "chevron.right")
                }
                .font(.footnote)
                .foregroundStyle(.gray)
            }
            .frame(height: 72)
        }
    }
    private func convertTimeStamp(date: Timestamp) -> String{
        let dateString = date.dateValue().formatted(date: .omitted, time: .shortened)
        return dateString
    }
}

#Preview {
    ConversationCellView(recentMessage: Message(fromId: "asd", toId: "dsa", messageText: "Hello there!", timestamp: .init(date: Date())))
}

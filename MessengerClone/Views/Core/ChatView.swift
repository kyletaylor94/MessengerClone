//
//  ChatView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct ChatView: View {
    let user: User
    @StateObject var viewModel: ChatViewModel
    
    init(user: User){
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                CircularProfieImageView(user: user, size: .xLarge)
                
                VStack(spacing: 4){
                    Text(user.fullname)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("messenger")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
            ///messageBubble
            ForEach(viewModel.messages){ message in
                ChatMessageCell(message: message)
            }
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
        
        ///message send function
        ZStack(alignment: .trailing){
            TextField("Message", text: $viewModel.messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button(action: {
                viewModel.sendMessage()
                viewModel.messageText = ""
            }, label: {
                Image(systemName: "paperplane")
            })
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    NavigationStack{
        ChatView(user: User.MOCK_USER)
    }
}

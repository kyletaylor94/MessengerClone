//
//  ConversationView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct ConversationView: View {
    @StateObject var viewModel = ConversationsViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    @State private var showNewmessageView = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                AvailablePeopleView()
                
                ForEach(viewModel.recentMessages){ message in
                    NavigationLink {
                        ChatView(user: message.user!)
                    } label: {
                        ConversationCellView(recentMessage: message)
                    }

                }
            }
            .modifier(ConversationModifiers(showNewmessageView: $showNewmessageView, selectedUser: $selectedUser, showChat: $showChat, user: user))
        }
    }
}

struct ConversationModifiers: ViewModifier{
    @Binding var showNewmessageView: Bool
    @Binding var selectedUser: User?
    @Binding var showChat: Bool
    @StateObject var viewModel = ConversationsViewModel()
    let user: User?
    
    func body(content: Content) -> some View {
        content
            .frame(height: UIScreen.main.bounds.height - 120)
            .padding(.horizontal)
            .buttonStyle(.plain)
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser{
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewmessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(value: user) {
                        CircularProfieImageView(user: user, size: .small)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showNewmessageView.toggle()
                        selectedUser = nil
                    }, label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray6))
                    })
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ConversationView()
}

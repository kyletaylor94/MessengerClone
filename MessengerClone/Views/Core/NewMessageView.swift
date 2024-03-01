//
//  SearchView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var search: String = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    
    var body: some View {
        NavigationStack{
            ScrollView{
                TextField("To:", text: $search)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("contacts")
                    .foregroundStyle(.gray)
                    .textCase(.uppercase)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding() 
               
                ForEach(viewModel.users){ user in
                    //NewMessageCellView(user: user)
                    VStack{
                        HStack{
                            CircularProfieImageView(user: user, size: .small)
                            
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 60)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    .foregroundStyle(.primary)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        NewMessageView(selectedUser: .constant(User.MOCK_USER))
    }
}

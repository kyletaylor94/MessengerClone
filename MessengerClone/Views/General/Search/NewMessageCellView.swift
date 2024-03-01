//
//  SearchPersonCell.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct NewMessageCellView: View {
    let user: User
    
    var body: some View {
        VStack{
            HStack{
                CircularProfieImageView(user: user, size: .small)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            Divider()
                .padding(.leading, 40)
            
        }
        .padding(.leading)
    }
}

#Preview {
    NewMessageCellView(user: User.MOCK_USER)
}

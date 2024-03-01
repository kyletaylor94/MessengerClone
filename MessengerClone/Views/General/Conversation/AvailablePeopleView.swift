//
//  AvailablePeopleView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct AvailablePeopleView: View {
    @StateObject var viewModel = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(viewModel.users, id: \.self){ user in
                    NavigationLink {
                        ChatView(user: user)
                    } label: {
                        VStack{
                            ZStack(alignment: .bottomTrailing){
                                CircularProfieImageView(user: user, size: .medium)
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    
                                    Circle()
                                        .fill(.green)
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }

                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    AvailablePeopleView()
}

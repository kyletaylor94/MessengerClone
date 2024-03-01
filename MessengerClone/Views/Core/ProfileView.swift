//
//  ProfileView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack{
            PhotosPicker(selection: $profileViewModel.selectedItem) {
                if let profileImage = profileViewModel.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    CircularProfieImageView(user: user, size: .xLarge)
                }
            }
            Text(user.fullname)
                .font(.title)
                .fontWeight(.semibold)
            
            List{
                Section{
                    ForEach(ProfileImageComponent.allCases) { component in
                        HStack{
                            Image(systemName: component.imageName)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(component.imageColor)
                            
                            Text(component.titleName)
                        }
                    }
                }
                Section{
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Text("Log Out")
                    })
                    .foregroundStyle(.red)

                    
                    Button(action: {
                        AuthService.shared.deleteUserData()
                    }, label: {
                        Text("Delete Account")
                    })
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}

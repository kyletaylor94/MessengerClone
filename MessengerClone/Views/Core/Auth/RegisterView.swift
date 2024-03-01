//
//  RegisterView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20){
            Spacer()
            
            LogoView()
            
            VStack{
                TextFieldComponent(text: $viewModel.email, isSecureField: false, placeholder: "Enter your Email")
                
                TextFieldComponent(text: $viewModel.password, isSecureField: true, placeholder: "Enter your password")
                
                TextFieldComponent(text: $viewModel.fullname, isSecureField: false, placeholder: "Enter your full name")
            }
            
            Button(action: {
                Task { try await viewModel.createUser() }
            }, label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.blue))
                    .cornerRadius(10)
            })
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegisterView()
}

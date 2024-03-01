//
//  LoginView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Spacer()
                LogoView()
                
                VStack(spacing: 10){
                    TextFieldComponent(text: $viewModel.email, isSecureField: false, placeholder: "Enter your email")
                    
                    TextFieldComponent(text: $viewModel.password, isSecureField: true, placeholder: "Enter your password")
                }
                
                Button(action: {
                    //
                }, label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button(action: {
                    Task { try await viewModel.login() }
                    
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.blue))
                        .cornerRadius(10)
                })
                .padding(.vertical)
               
              
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                HStack{
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.blue)
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegisterView()
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}

struct TextFieldComponent: View {
    @Binding var text: String
    let isSecureField: Bool
    let placeholder: String
    
    var body: some View {
        if isSecureField {
            SecureField(placeholder, text: $text)
                .font(.subheadline)
                .padding(12)
                .background(
                    Color(.systemGray6)
                )
                .cornerRadius(10)
                .padding(.horizontal, 24)
            
        } else {
            TextField(placeholder, text: $text)
                .font(.subheadline)
                .padding(12)
                .background(
                    Color(.systemGray6)
                )
                .cornerRadius(10)
                .padding(.horizontal, 24)
        }
    }
}

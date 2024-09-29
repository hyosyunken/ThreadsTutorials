//
//  RegistrationView.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = RegistrationViewModel()

    var body: some View {
        VStack {
            Spacer()
            
            Image(.threadsAppIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
            SecureField("Enter your password", text: $viewModel.password)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your fullname", text: $viewModel.fullname)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your username", text: $viewModel.username)
                .textInputAutocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsBlackButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Login")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}

//
//  CreateThreadView.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var caption: String = ""
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    // user avatar
                    CircularProfileImageView(user: user, size: .small)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        // user fullname
                        Text(user?.fullName ?? "")
                            .fontWeight(.semibold)
                        
                        // caption to post
                        TextField("Start a thread...", text:$caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    // clear caption xmark
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    // cancel button
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // post button
                    Button {
                        Task {
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}

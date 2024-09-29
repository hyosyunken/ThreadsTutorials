//
//  CurrentUserProfileView.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/28.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfileView: Bool = false

    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // bio and stats
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    HStack(spacing: 16) {
                        Button {
                            showEditProfileView.toggle()
                        } label: {
                            Text("Edit Profile")
                                .modifier(CurrentUserProfileButtonModifier())
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Share Profile")
                                .modifier(CurrentUserProfileButtonModifier())
                        }
                    }
                    
                    
                    // user content list view
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }

                }
            }
            .sheet(isPresented: $showEditProfileView, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}

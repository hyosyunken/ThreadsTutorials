//
//  RegistrationViewModel.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var username: String = ""
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: Create user here...")
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullName: fullname,
            userName: username
        )

    }
}

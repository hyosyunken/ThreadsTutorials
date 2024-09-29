//
//  LoginViewModel.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        print("DEBUG: user login here...")
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}

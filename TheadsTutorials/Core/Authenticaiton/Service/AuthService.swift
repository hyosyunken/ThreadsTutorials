//
//  AuthService.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullName: fullName, userName: userName, id: result.user.uid)

        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() //signs out on backend
        self.userSession = nil // remove session locally
        
        UserService.shared.reset() // set current user object to nil
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullName: String,
        userName: String,
        id: String
    ) async throws {
        let user = User(id: id, fullName: fullName, email: email, userName: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}

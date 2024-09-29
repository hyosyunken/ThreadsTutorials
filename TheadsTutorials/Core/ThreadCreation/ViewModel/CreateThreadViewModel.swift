//
//  CreateThreadViewModel.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/28.
//

import Foundation
import Firebase
import FirebaseAuth

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}

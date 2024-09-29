//
//  FeedViewModel.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/29.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadOwner = try await UserService.fetchUser(withUid: ownerUid)
            
            threads[i].user = threadOwner
        }
    }
}

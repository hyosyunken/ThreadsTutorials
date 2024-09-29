//
//  PreviewProvider.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import Foundation
import SwiftUI
import Firebase

extension DeveloperToolsSupport.Preview {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Xiao Ru", email: "woyaonaole@gmail.com", userName: "woyaonaole1")
    
    let thread = Thread(ownerUid: "123213", caption: "This is a thread for preview", timestamp: Timestamp(), likes: 9)
}

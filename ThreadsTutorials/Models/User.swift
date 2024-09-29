//
//  User.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let userName: String
    var profileImageUrl: String?
    var bio: String?
}

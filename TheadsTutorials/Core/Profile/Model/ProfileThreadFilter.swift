//
//  ProfileThreadFilter.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}

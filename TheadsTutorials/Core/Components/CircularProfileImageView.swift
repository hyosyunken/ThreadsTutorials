//
//  CircularProfileImageView.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case lagre
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .lagre: return 64
        case .xLarge: return 80
        }
    }
}



struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(Color(.systemGray4))
                .frame(width: size.dimension, height: size.dimension)
        }
    }
}

#Preview {
    CircularProfileImageView(user: DeveloperToolsSupport.Preview.dev.user, size: .medium)
}

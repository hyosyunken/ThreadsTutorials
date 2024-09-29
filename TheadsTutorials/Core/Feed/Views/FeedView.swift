//
//  FeedView.swift
//  TheadsTutorials
//
//  Created by ronnie on 2024/9/27.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchThreads() }

            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        Task { try await viewModel.fetchThreads() }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.black)
                    }

                }
            }

        }
    }
}

#Preview {
    FeedView()
}

//
//  TryView.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 19/01/2023.
//

import SwiftUI

struct TryView<Content: View>: View {
    
    var result: Result<Content, Error>
    let onRetry: (() async -> Void)? // TODO: Move this to a modifier specifically for this view?
    
    init(onRetry: (() async -> Void)? = nil, @ViewBuilder content: () throws -> Content) {
        self.onRetry = onRetry
        do {
            result = .success(try content())
        } catch {
            result = .failure(error)
        }
    }
    
    var body: some View {
        switch result {
        case .success(let content):
            content
        case .failure(let error):
            VStack {
                Text("sum ting wong")
                    .style(.header)
                Text(error.localizedDescription)
                    .style(.body)
                Spacer()
                if onRetry != nil {
                    Button(action: didTapRetry, label: { Text("retry") })
                }
            }
        }
    }
}

// MARK: Actions
extension TryView {
    
    func didTapRetry() {
        Task { await onRetry?() }
    }
}

struct TryView_Previews: PreviewProvider {
    static var previews: some View {
        TryView {
            Text("Test")
        }
    }
}

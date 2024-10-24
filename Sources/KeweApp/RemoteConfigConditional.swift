//
//  RemoteConfigtional.swift
//  MyDates
//
//  Created by Jin on 10/24/24.
//

import SwiftUI
import FirebaseRemoteConfig

public struct RemoteConfigConditional<Content: View>: View {
    @RemoteConfigProperty var showContent: Bool
    let content: Content

    public init(name: String, fallback: Bool = true, @ViewBuilder content: () -> Content) {
        _showContent = .init(key: name, fallback: fallback)
        self.content = content()
    }

    public var body: some View {
        if showContent {
            content
        }
    }
}

public struct RemoteText<Content: View>: View {
    @RemoteConfigProperty var string: String

    public init(_ string: String, key: String? = nil) {
        if let key {
            _string = .init(key: key, fallback: string)
        } else {
            _string = .init(key: string, fallback: string)
        }
    }

    public var body: some View {
        Text(string)
    }
}

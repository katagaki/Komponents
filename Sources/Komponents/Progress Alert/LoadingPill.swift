//
//  LoadingPill.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/11/24.
//

import SwiftUI

public struct LoadingPill: View {
    var namespace: Namespace.ID
    @Binding var headerText: String?
    @Binding var bodyText: String?

    public init(
        namespace: Namespace.ID,
        headerText: Binding<String?>,
        bodyText: Binding<String?>) {
        self.namespace = namespace
        self._headerText = headerText
        self._bodyText = bodyText
    }

    public var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            HStack(spacing: 4.0) {
                ProgressView()
                    .matchedGeometryEffect(id: "LoadingProgressIndicator", in: namespace)
                if headerText != nil || bodyText != nil {
                    VStack(spacing: 2.0) {
                        if let headerText {
                            Text(NSLocalizedString(headerText, comment: ""))
                                .font(.caption)
                                .fontWeight(.bold)
                                .matchedGeometryEffect(id: "LoadingProgressHeader", in: namespace)
                        }
                        if let bodyText {
                            Text(NSLocalizedString(bodyText, comment: ""))
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .matchedGeometryEffect(id: "LoadingProgressText", in: namespace)
                        }
                    }
                }
            }
            .padding(.vertical, 4.0)
            .padding(.horizontal, 8.0)
            #if os(iOS)
            .background(Color(uiColor: .secondarySystemBackground))
            #else
            .background(Color(nsColor: .windowBackgroundColor))
            #endif
            .clipShape(.capsule(style: .continuous))
            .matchedGeometryEffect(id: "LoadingWindow", in: namespace)
            .padding(.horizontal, 8.0)
            #if os(iOS)
            .padding(.top, UIDevice.current.userInterfaceIdiom != .pad ? 8.0 : 64.0)
            #else
            .padding(.top, 8.0)
            #endif
            .shadow(radius: 3.0, y: 3.0)
        }
        .transition(.move(edge: .top).animation(.smooth.speed(2.0)))
    }
}

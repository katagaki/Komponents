//
//  LoadingPillGlassModifier.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2025/11/04.
//

import SwiftUI

struct LoadingPillGlassModifier: ViewModifier {

    var namespace: Namespace.ID

    public func body(content: Content) -> some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            content
                .glassEffect(.regular, in: .capsule)
                .matchedGeometryEffect(id: "LoadingWindow", in: namespace)
                .padding(.horizontal, 8.0)
#if os(iOS)
                .padding(.top, UIDevice.current.userInterfaceIdiom != .pad ? 8.0 : 64.0)
#else
                .padding(.top, 8.0)
#endif
        } else {
            content
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
    }
}

extension View {
    public func loadingPillGlass(_ namespace: Namespace.ID) -> some View {
        self.modifier(LoadingPillGlassModifier(namespace: namespace))
    }
}

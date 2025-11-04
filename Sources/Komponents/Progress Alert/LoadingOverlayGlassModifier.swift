//
//  LoadingOverlayGlassModifier.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2025/11/04.
//

import SwiftUI

struct LoadingOverlayGlassModifier: ViewModifier {

    public func body(content: Content) -> some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            content
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 16.0))
        } else {
            content
                .background(Material.regular)
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
        }
    }
}

extension View {
    public func loadingOverlayGlass() -> some View {
        self.modifier(LoadingOverlayGlassModifier())
    }
}

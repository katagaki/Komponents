//
//  BarAccessory.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/08/06.
//

import SwiftUI

public struct BarAccessory<Content: View>: View {

    public var placement: Placement
    private var isBackgroundSolid: Bool
    @ViewBuilder public let content: Content

    public init(placement: Placement, isBackgroundSolid: Bool = false, content: @escaping () -> Content) {
        self.placement = placement
        self.isBackgroundSolid = isBackgroundSolid
        self.content = content()
    }

    public var body: some View {
        switch placement {
        case .top:
            content
                .frame(maxWidth: .infinity)
                .modifier(ConditionalBackground(isSolid: self.isBackgroundSolid))
                .background(Material.bar)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1/3)
                        .foregroundColor(.primary.opacity(0.2))
                        .ignoresSafeArea(edges: [.leading, .trailing])
                }
        case .bottom:
            content
                .frame(maxWidth: .infinity)
                .modifier(ConditionalBackground(isSolid: self.isBackgroundSolid))
                .overlay(alignment: .top) {
                    Rectangle()
                        .frame(height: 1/3)
                        .foregroundColor(.primary.opacity(0.2))
                        .ignoresSafeArea(edges: [.leading, .trailing])
                }
        }
    }

    public enum Placement {
        case top
        case bottom
    }

}

fileprivate struct ConditionalBackground: ViewModifier {
    var isSolid: Bool = false
    func body(content: Content) -> some View {
        if isSolid {
            content
        } else {
            content
                .background(Material.bar)
        }
    }
}

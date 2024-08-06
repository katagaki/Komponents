//
//  BarAccessory.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/08/06.
//

import SwiftUI

public struct BarAccessory<Content: View>: View {

    public var placement: Placement
    @ViewBuilder public let content: Content

    public init(placement: Placement, content: Content) {
        self.placement = placement
        self.content = content
    }

    public var body: some View {
        switch placement {
        case .top:
            content
                .frame(maxWidth: .infinity)
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
                .background(Material.bar)
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

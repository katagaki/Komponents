//
//  BarAccessoryMenu.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/08/16.
//

import SwiftUI

public struct BarAccessoryMenu<Content: View>: View {

    @ViewBuilder let menuItems: Content
    public var icon: String?
    public var text: LocalizedStringKey

    public init(_ text: LocalizedStringKey, icon: String? = nil, @ViewBuilder menuItems: @escaping () -> Content) {
        self.menuItems = menuItems()
        self.icon = icon
        self.text = text
    }

    public var body: some View {
        Menu {
            menuItems
        } label: {
            HStack(spacing: 8.0) {
                if let icon {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18.0, height: 18.0)
                }
                Text(text)
                    .fontWeight(.medium)
            }
            .foregroundStyle(.white)
            .padding([.top, .bottom], 12.0)
            .padding([.leading, .trailing], 16.0)
            .background(Color.accentColor)
        }
        .buttonStyle(.plain)
        .clipShape(.capsule)
    }
}

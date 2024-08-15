//
//  BarAccessoryButton.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/08/06.
//

import SwiftUI

public struct BarAccessoryButton: View {

    public var icon: String?
    public var text: LocalizedStringKey
    public var action: () -> Void
    public var isSecondary: Bool = false
    public var isTextLight: Bool = true

    public init(_ text: LocalizedStringKey, icon: String? = nil, isTextLight: Bool, action: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.isTextLight = isTextLight
        self.action = action
    }

    public init(_ text: LocalizedStringKey, icon: String? = nil, isSecondary: Bool, action: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.action = action
        self.isSecondary = isSecondary
    }

    public var body: some View {
        Group {
            if !isSecondary {
                Button {
                    action()
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
                    .foregroundStyle((isTextLight ? Color.white : Color.black))
                    .padding([.top, .bottom], 12.0)
                    .padding([.leading, .trailing], 16.0)
                    .background(Color.accentColor)
                }
            } else {
                Button {
                    action()
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
                    .foregroundStyle(.primary)
                    .padding([.top, .bottom], 12.0)
                    .padding([.leading, .trailing], 16.0)
                    .background(.primary.opacity(0.1))
                }
            }
        }
        .buttonStyle(.plain)
        .clipShape(.capsule)
    }
}

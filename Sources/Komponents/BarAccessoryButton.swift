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
    public var accentColor: Color?
    public var action: () -> Void
    public var isSecondary: Bool = false
    public var isTextLight: Bool = true

    public init(_ text: LocalizedStringKey, icon: String? = nil, accentColor: Color? = nil,
                isTextLight: Bool = true, isSecondary: Bool = false, action: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.accentColor = accentColor
        self.isTextLight = isTextLight
        self.isSecondary = isSecondary
        self.action = action
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
                    .background(accentColor == nil ? Color.accentColor : accentColor)
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

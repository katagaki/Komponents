//
//  BarAccessoryPicker.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/08/16.
//

import SwiftUI

public struct BarAccessoryPicker<Content: View, T: Hashable>: View {

    @ViewBuilder let pickerItems: Content
    public var icon: String?
    public var text: LocalizedStringKey
    public var selection: Binding<T>

    public init(_ text: LocalizedStringKey, icon: String? = nil, selection: Binding<T>, @ViewBuilder pickerItems: @escaping () -> Content) {
        self.pickerItems = pickerItems()
        self.icon = icon
        self.text = text
        self.selection = selection
    }

    public var body: some View {
        Picker(selection: selection) {
            pickerItems
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

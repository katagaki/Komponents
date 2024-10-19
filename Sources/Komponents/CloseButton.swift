//
//  CloseButton.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2023/09/30.
//

import SwiftUI

public struct CloseButton: View {

    public var action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.primary)
                .symbolRenderingMode(.hierarchical)
                .font(.title2)
        }
        .buttonStyle(.plain)
    }
}

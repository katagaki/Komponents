//
//  HintOverlay.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct HintOverlay: View {
    var image: String
    var text: String

    public var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            Image(systemName: image)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 32.0, weight: .regular))
                .foregroundColor(.secondary)
            Text(NSLocalizedString(text, comment: ""))
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(16.0)
    }
}

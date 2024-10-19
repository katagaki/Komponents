//
//  ListAppIconRow.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/10/19.
//

import SwiftUI

struct ListAppIconRow: View {
    public var image: String
    public var text: String
    public var iconToSet: String?

    public init(image: String, text: String, iconToSet: String? = nil) {
        self.image = image
        self.text = text
        self.iconToSet = iconToSet
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(image)
                .resizable()
                .frame(width: 60.0, height: 60.0)
                .clipped(antialiased: true)
                .mask {
                    RoundedRectangle(cornerRadius: 14.0)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 14.0)
                        .stroke(.thickMaterial, lineWidth: 1.0)
                }
            Text(NSLocalizedString(text, comment: ""))
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

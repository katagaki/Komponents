//
//  ListAppIconRow.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/10/19.
//

import SwiftUI

public struct ListAppIconRow: View {
    public var icon: AppIcon

    public init(_ icon: AppIcon) {
        self.icon = icon
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(((icon.imageName ?? "AppIcon") + ".Preview"))
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
            Text(NSLocalizedString(icon.name, comment: ""))
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

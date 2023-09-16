//
//  ListRow.swift
//  
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct ListRow: View {
    public var image: String
    public var title: String
    public var subtitle: String?
    public var includeSpacer: Bool = false

    public var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(image)
                .resizable()
                .frame(width: 30.0, height: 30.0)
            VStack(alignment: .leading, spacing: 2.0) {
                Text(NSLocalizedString(title, comment: ""))
                    .font(.body)
                if let subtitle = subtitle {
                    Text(NSLocalizedString(subtitle, comment: ""))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            if includeSpacer {
                Spacer()
            }
        }
    }
}

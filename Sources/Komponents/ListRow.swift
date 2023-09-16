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
    public var includeSpacer: Bool
    public var bundle: Bundle

    public init(image: String, title: String, subtitle: String? = nil,
                includeSpacer: Bool = false, bundle: Bundle) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.includeSpacer = includeSpacer
        self.bundle = bundle
    }

    public init(image: String, title: String, subtitle: String? = nil,
                includeSpacer: Bool = false) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.includeSpacer = includeSpacer
        self.bundle = .main
    }

    public init(image: String, title: String, bundle: Bundle) {
        self.image = image
        self.title = title
        self.includeSpacer = false
        self.bundle = bundle
    }

    public init(image: String, title: String) {
        self.image = image
        self.title = title
        self.includeSpacer = false
        self.bundle = .main
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(image, bundle: bundle)
                .resizable()
                .frame(width: 30.0, height: 30.0)
            VStack(alignment: .leading, spacing: 2.0) {
                if NSLocalizedString(title, bundle: bundle, comment: "") == title {
                    Text(verbatim: title)
                        .font(.body)
                } else {
                    Text(LocalizedStringKey(title), bundle: bundle)
                        .font(.body)
                }
                if let subtitle = subtitle {
                    Text(verbatim: NSLocalizedString(subtitle, bundle: bundle, comment: ""))
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

//
//  ListSectionHeader.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct ListSectionHeader: View {

    public var text: String
    public var bundle: Bundle

    public init(text: String, bundle: Bundle) {
        self.text = text
        self.bundle = bundle
    }

    public init(text: String) {
        self.text = text
        self.bundle = .main
    }

    public var body: some View {
        Text(LocalizedStringKey(text), bundle: bundle)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .textCase(nil)
            .lineLimit(1)
            .truncationMode(.middle)
            .allowsTightening(true)
    }
}

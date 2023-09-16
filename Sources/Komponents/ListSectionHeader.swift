//
//  ListSectionHeader.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct ListSectionHeader: View {
    var text: String

    public var body: some View {
        Text(NSLocalizedString(text, comment: ""))
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .textCase(nil)
            .lineLimit(1)
            .truncationMode(.middle)
            .allowsTightening(true)
    }
}

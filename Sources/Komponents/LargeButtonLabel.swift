//
//  LargeButtonLabel.swift
//  
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct LargeButtonLabel: View {

    @State public var iconName: String?
    @State public var text: String

    public var body: some View {
        HStack(alignment: .center, spacing: 4.0) {
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            Text(NSLocalizedString(text, comment: ""))
                .padding([.top, .bottom], 8.0)
        }
        .padding([.leading, .trailing], 10.0)
    }
}

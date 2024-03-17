//
//  ActionButton.swift
//  
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct ActionButton: View {

    public var text: String
    public var icon: String
    public var isPrimary: Bool = false
    public var action: () -> Void

    public init(text: String, icon: String, isPrimary: Bool, action: @escaping () -> Void) {
        self.text = text
        self.icon = icon
        self.isPrimary = isPrimary
        self.action = action
    }

    public var body: some View {
        if isPrimary {
            Button {
                action()
            } label: {
                HStack(alignment: .center, spacing: 4.0) {
                    if UIImage(named: icon) != nil {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18.0, height: 18.0)
                    } else {
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18.0, height: 18.0)
                    }
                    Text(NSLocalizedString(text, comment: ""))
                        .bold()
                }
                .frame(minHeight: 24.0)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .clipShape(RoundedRectangle(cornerRadius: 99))
        } else {
            Button {
                action()
            } label: {
                HStack(alignment: .center, spacing: 4.0) {
                    if UIImage(named: icon) != nil {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18.0, height: 18.0)
                    } else {
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18.0, height: 18.0)
                    }
                    Text(NSLocalizedString(text, comment: ""))
                        .bold()
                }
                .frame(minHeight: 24.0)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .clipShape(RoundedRectangle(cornerRadius: 99))
        }
    }
}

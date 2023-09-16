//
//  LicensesView.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct LicensesView: View {

    public var licenses: [License]

    public init(licenses: [License]) {
        self.licenses = licenses
    }

    public var body: some View {
        List(licenses, id: \.libraryName) { license in
            Section {
                Text(license.text)
                    .font(.caption)
                    .monospaced()
            } header: {
                ListSectionHeader(text: license.libraryName)
                    .font(.body)
            }
        }
        .listStyle(.grouped)
        .navigationTitle(NSLocalizedString("ViewTitle.Attributions", bundle: .module, comment: ""))
    }
}

public struct License {
    public var libraryName: String
    public var text: String

    public init(libraryName: String, text: String) {
        self.libraryName = libraryName
        self.text = text
    }
}

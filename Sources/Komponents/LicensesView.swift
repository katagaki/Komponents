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
        .navigationTitle("ViewTitle.Attributions")
    }
}

public struct License {
    var libraryName: String
    var text: String
}

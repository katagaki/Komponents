//
//  LicensesView.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct LicensesView: View {

    @State var licenses: [License]

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

struct License {
    var libraryName: String
    var text: String
}

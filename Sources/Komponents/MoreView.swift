//
//  MoreView.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

struct MoreView: View {

    @State var sections: AnyView
    @State var githubRepoName: String
    @State var attributionsViewPath: AnyHashable

    var body: some View {
        List {
            sections
            Section {
                Link(destination: URL(string: "https://x.com/katagaki_")!) {
                    HStack {
                        ListRow(image: "ListIcon.Twitter",
                                title: "More.Help.Twitter",
                                subtitle: "More.Help.Twitter.Subtitle",
                                includeSpacer: true)
                        Image(systemName: "safari")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
                Link(destination: URL(string: "mailto:ktgk.public@icloud.com")!) {
                    HStack {
                        ListRow(image: "ListIcon.Email",
                                title: "More.Help.Email",
                                subtitle: "More.Help.Email.Subtitle",
                                includeSpacer: true)
                        Image(systemName: "arrow.up.forward.app")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
                Link(destination: URL(string: "https://github.com/katagaki/\(githubRepoName)")!) {
                    HStack {
                        ListRow(image: "ListIcon.GitHub",
                                title: "More.Help.GitHub".replacingOccurrences(of: "%@", with: githubRepoName),
                                subtitle: "More.Help.GitHub.Subtitle",
                                includeSpacer: true)
                        Image(systemName: "safari")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
            } header: {
                ListSectionHeader(text: "More.Help")
                    .font(.body)
            }
            Section {
                NavigationLink(value: attributionsViewPath) {
                    ListRow(image: "ListIcon.Attributions",
                            title: "More.Attributions")
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("ViewTitle.More")
    }
}

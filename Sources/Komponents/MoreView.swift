//
//  MoreView.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct MoreView<Content: View>: View {

    @ViewBuilder let sections: Content
    var githubRepoName: String
    var attributionsViewPath: AnyHashable

    public init(repoName: String, viewPath: AnyHashable, @ViewBuilder sections: @escaping () -> Content) {
        self.sections = sections()
        self.githubRepoName = repoName
        self.attributionsViewPath = viewPath
    }

    public var body: some View {
        List {
            sections
            Section {
                Link(destination: URL(string: "https://x.com/katagaki_")!) {
                    HStack {
                        ListRow(image: "ListIcon.Twitter",
                                title: NSLocalizedString("More.Help.Twitter", bundle: .module, comment: ""),
                                subtitle: NSLocalizedString("More.Help.Twitter.Subtitle", bundle: .module, comment: ""),
                                includeSpacer: true,
                                bundle: .module)
                        Image(systemName: "safari")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
                Link(destination: URL(string: "mailto:ktgk.public@icloud.com")!) {
                    HStack {
                        ListRow(image: "ListIcon.Email",
                                title: NSLocalizedString("More.Help.Email", bundle: .module, comment: ""),
                                subtitle: NSLocalizedString("More.Help.Email.Subtitle", bundle: .module, comment: ""),
                                includeSpacer: true,
                                bundle: .module)
                        Image(systemName: "arrow.up.forward.app")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
                Link(destination: URL(string: "https://github.com/katagaki/\(githubRepoName)")!) {
                    HStack {
                        ListRow(image: "ListIcon.GitHub",
                                title: NSLocalizedString("More.Help.GitHub", bundle: .module, comment: ""),
                                subtitle: githubRepoName,
                                includeSpacer: true,
                                bundle: .module)
                        Image(systemName: "safari")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
            } header: {
                ListSectionHeader(text: NSLocalizedString("More.Help", bundle: .module, comment: ""))
                    .font(.body)
            }
            Section {
                NavigationLink(value: attributionsViewPath) {
                    ListRow(image: "ListIcon.Attributions",
                            title: NSLocalizedString("More.Attributions", bundle: .module, comment: ""),
                            bundle: .module)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(NSLocalizedString("ViewTitle.More", bundle: .module, comment: ""))
    }
}

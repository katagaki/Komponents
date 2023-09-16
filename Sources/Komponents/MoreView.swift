//
//  MoreView.swift
//
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct MoreView<Content: View>: View {

    @ViewBuilder let sections: Content
    @State var githubRepoName: String?
    @State var attributionsViewPath: AnyHashable?

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
                                title: "More.Help.Twitter",
                                subtitle: "More.Help.Twitter.Subtitle",
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
                                title: "More.Help.Email",
                                subtitle: "More.Help.Email.Subtitle",
                                includeSpacer: true,
                                bundle: .module)
                        Image(systemName: "arrow.up.forward.app")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
                Link(destination: URL(string: "https://github.com/katagaki/\(githubRepoName ?? "")")!) {
                    HStack {
                        ListRow(image: "ListIcon.GitHub",
                                title: "More.Help.GitHub",
                                subtitle: "More.Help.GitHub.Subtitle".replacingOccurrences(of: "%@", with: githubRepoName ?? ""),
                                includeSpacer: true,
                                bundle: .module)
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
                            title: "More.Attributions",
                            bundle: .module)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("ViewTitle.More")
    }
}

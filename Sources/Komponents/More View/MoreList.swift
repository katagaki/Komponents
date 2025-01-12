//
//  MoreList.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2023/09/16.
//

import SwiftUI

public struct MoreList<Content: View>: View {

    @ViewBuilder let sections: Content
    var githubRepoName: String
    var attributionsViewPath: (any Hashable)?

    @State var showsAttributions: Bool = false

    public init(repoName: String, @ViewBuilder sections: @escaping () -> Content) {
        self.sections = sections()
        self.githubRepoName = repoName
    }

    public init(repoName: String, viewPath: any Hashable, @ViewBuilder sections: @escaping () -> Content) {
        self.sections = sections()
        self.githubRepoName = repoName
        self.attributionsViewPath = viewPath
    }

    public var body: some View {
        List {
            sections
            Section {
                Link(destination: URL(string: "https://github.com/\(githubRepoName)")!) {
                    HStack {
                        ListRow(image: "ListIcon.GitHub",
                                title: "More.GitHub",
                                subtitle: githubRepoName,
                                includeSpacer: true,
                                bundle: .module)
                        Image(systemName: "safari")
                            .opacity(0.5)
                    }
                    .foregroundColor(.primary)
                }
                if let attributionsViewPath = attributionsViewPath {
                    NavigationLink(value: attributionsViewPath) {
                        ListRow(image: "ListIcon.Attributions",
                                title: "More.Attributions",
                                bundle: .module)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(NSLocalizedString("ViewTitle.More", bundle: .module, comment: ""))
    }
}

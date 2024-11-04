//
//  Navigator.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/11/04.
//

import Foundation

public class Navigator<TabType: TabTypeProtocol, ViewPath: ViewPathProtocol>: ObservableObject {

    let defaults = UserDefaults.standard
    let selectedTabKey = "Navigator.SelectedTab"

    @Published public var selectedTab: TabType
    @Published public var previouslySelectedTab: TabType
    @Published public var tabPaths: [TabType: [ViewPath]]

    public init() {
        let savedSelectedTab = defaults.integer(forKey: selectedTabKey)
        if let selectedTab = TabType(rawValue: savedSelectedTab as! TabType.RawValue) {
            self.selectedTab = selectedTab
            self.previouslySelectedTab = selectedTab
        } else {
            self.selectedTab = .defaultTab
            self.previouslySelectedTab = .defaultTab
        }

        var newTabPaths: [TabType: [ViewPath]] = [:]
        for tab in TabType.allCases {
            newTabPaths[tab] = []
        }
        self.tabPaths = newTabPaths
    }

    public subscript(tabType: TabType) -> [ViewPath] {
        get {
            return tabPaths[tabType] ?? []
        }
        set(newViewPath) {
            tabPaths[tabType] = newViewPath
        }
    }

    public func popToRoot(for tab: TabType) {
        tabPaths[tab]?.removeAll()
    }

    public func push(_ viewPath: ViewPath, for tab: TabType) {
        tabPaths[tab]?.append(viewPath)
    }

    public func saveToDefaults() {
        defaults.setValue(selectedTab.rawValue, forKey: selectedTabKey)
        defaults.synchronize()
    }
}

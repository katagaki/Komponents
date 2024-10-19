//
//  AppIcon.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/10/19.
//

import Foundation

public struct AppIcon {
    public var previewImageName: String
    public var name: String
    public var iconName: String?

    public init(previewImageName: String, name: String, iconName: String? = nil) {
        self.previewImageName = previewImageName
        self.name = name
        self.iconName = iconName
    }
}

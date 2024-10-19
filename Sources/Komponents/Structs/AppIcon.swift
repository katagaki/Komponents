//
//  AppIcon.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/10/19.
//

import Foundation

public struct AppIcon {
    public var name: String
    public var imageName: String?

    public init(_ name: String, imageName: String? = nil) {
        self.name = name
        self.imageName = imageName
    }
}

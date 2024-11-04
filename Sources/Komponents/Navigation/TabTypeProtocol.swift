//
//  TabTypeProtocol.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/11/04.
//

import Foundation

public protocol TabTypeProtocol: CaseIterable, Equatable, Hashable, RawRepresentable {
    static var defaultTab: Self { get }
}

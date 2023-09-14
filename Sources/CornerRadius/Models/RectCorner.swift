//
//  RectCorner.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import UIKit

public struct RectCorner: OptionSet {
    public let rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    public static let topLeading = RectCorner(rawValue: 1 << 0)
    public static let topTrailing = RectCorner(rawValue: 1 << 1)
    public static let bottomLeading = RectCorner(rawValue: 1 << 2)
    public static let bottomTrailing = RectCorner(rawValue: 1 << 3)
    public static var allCorners: RectCorner {
        [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
    }
    public static var top: RectCorner {
        [.topLeading, .topTrailing]
    }
    public static var bottom: RectCorner {
        [.bottomLeading, .bottomTrailing]
    }
    public static var leading: RectCorner {
        [.topLeading, .bottomLeading]
    }
    public static var trailing: RectCorner {
        [.topTrailing, .bottomTrailing]
    }
}

extension RectCorner {
    public init(rectCorner: UIRectCorner, isLeftToRight: Bool = true) {
        var result = RectCorner()
        if rectCorner.contains(.topLeft) {
            result = result.union(isLeftToRight ? .topLeading : .topTrailing)
        }
        if rectCorner.contains(.topRight) {
            result = result.union(isLeftToRight ? .topTrailing : .topLeading)
        }
        if rectCorner.contains(.bottomLeft) {
            result = result.union(isLeftToRight ? .bottomLeading : .bottomTrailing)
        }
        if rectCorner.contains(.bottomRight) {
            result = result.union(isLeftToRight ? .bottomTrailing : .bottomLeading)
        }
        self.init(rawValue: result.rawValue)
    }
}

extension RectCorner {
    func uiRectCorner(isLeftToRight: Bool = true) -> UIRectCorner {
        var result = UIRectCorner()
        if contains(.topLeading) {
            result = result.union(isLeftToRight ? .topLeft : .topRight)
        }
        if contains(.topTrailing) {
            result = result.union(isLeftToRight ? .topRight : .topLeft)
        }
        if contains(.bottomLeading) {
            result = result.union(isLeftToRight ? .bottomLeft : .bottomRight)
        }
        if contains(.bottomTrailing) {
            result = result.union(isLeftToRight ? .bottomRight : .bottomLeft)
        }
        return result
    }
}

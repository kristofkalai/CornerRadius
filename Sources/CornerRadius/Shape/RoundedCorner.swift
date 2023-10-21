//
//  RoundedCorner.swift
//
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import UIKit
import SwiftUI

public struct RoundedCorner {
    public static let defaultRadii: (CGRect) -> CGSize = { .init(width: $0.width / 2, height: $0.height / 2) }
    public static let defaultCorners: RectCorner = .allCorners
    public static let defaultLayoutDirection = LayoutDirection.leftToRight

    let radii: (CGRect) -> CGSize
    let corners: RectCorner
    let isLeftToRight: Bool

    public init(
        radii: @escaping (CGRect) -> CGSize = defaultRadii,
        corners: RectCorner = defaultCorners,
        isLeftToRight: Bool
    ) {
        self.radii = radii
        self.corners = corners
        self.isLeftToRight = isLeftToRight
    }
}

extension RoundedCorner {
    public init(
        radii: @escaping (CGRect) -> CGSize = defaultRadii,
        corners: RectCorner = defaultCorners,
        layoutDirection: LayoutDirection = defaultLayoutDirection
    ) {
        self.init(radii: radii, corners: corners, isLeftToRight: layoutDirection.isLeftToRight)
    }

    public init(radii: CGSize, corners: RectCorner = defaultCorners, isLeftToRight: Bool) {
        self.init(radii: { _ in radii }, corners: corners, isLeftToRight: isLeftToRight)
    }

    public init(radii: CGSize, corners: RectCorner = defaultCorners, layoutDirection: LayoutDirection = defaultLayoutDirection) {
        self.init(radii: { _ in radii }, corners: corners, isLeftToRight: layoutDirection.isLeftToRight)
    }

    public init(radius: CGFloat, corners: RectCorner = defaultCorners, isLeftToRight: Bool) {
        self.init(radii: .init(width: radius, height: radius), corners: corners, isLeftToRight: isLeftToRight)
    }

    public init(radius: CGFloat, corners: RectCorner = defaultCorners, layoutDirection: LayoutDirection = defaultLayoutDirection) {
        self.init(radius: radius, corners: corners, isLeftToRight: layoutDirection.isLeftToRight)
    }
}

extension RoundedCorner: Shape {
    public func path(in rect: CGRect) -> Path {
        .init(
            in: rect,
            byRoundingCorners: corners.uiRectCorner(isLeftToRight: isLeftToRight),
            cornerRadii: radii(rect),
            close: true
        )
    }
}

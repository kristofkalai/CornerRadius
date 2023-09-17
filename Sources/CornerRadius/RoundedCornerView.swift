//
//  RoundedCornerView.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import SwiftUI

public struct RoundedCornerView<Content: View> {
    @Environment(\.layoutDirection) private var layoutDirection

    private let corners: RectCorner
    private let border: BorderConfiguration
    private let borderType: BorderType
    private let radii: (CGRect) -> CGSize
    private let content: () -> Content

    public init(
        corners: RectCorner = RoundedCorner.defaultCorners,
        border: BorderConfiguration,
        borderType: BorderType = .default,
        radii: @escaping (CGRect) -> CGSize = RoundedCorner.defaultRadii,
        content: @escaping () -> Content
    ) {
        self.corners = corners
        self.border = border
        self.borderType = borderType
        self.radii = radii
        self.content = content
    }
}

extension RoundedCornerView {
    public init(
        corners: RectCorner = RoundedCorner.defaultCorners,
        border: BorderConfiguration,
        borderType: BorderType = .default,
        radii: CGSize,
        content: @escaping () -> Content
    ) {
        self.init(corners: corners, border: border, borderType: borderType, radii: { _ in radii }, content: content)
    }

    public init(
        corners: RectCorner = RoundedCorner.defaultCorners,
        border: BorderConfiguration,
        borderType: BorderType = .default,
        radius: CGFloat,
        content: @escaping () -> Content
    ) {
        self.init(corners: corners, border: border, borderType: borderType, radii: .init(width: radius, height: radius), content: content)
    }
}

extension RoundedCornerView {
    public init(
        corners: RectCorner = RoundedCorner.defaultCorners,
        border: BorderConfiguration,
        borderType: BorderType = .default,
        radii: @escaping (CGRect) -> CGSize = RoundedCorner.defaultRadii,
        content: Content
    ) {
        self.init(corners: corners, border: border, borderType: borderType, radii: radii, content: { content })
    }

    public init(
        corners: RectCorner = RoundedCorner.defaultCorners,
        border: BorderConfiguration,
        borderType: BorderType = .default,
        radii: CGSize,
        content: Content
    ) {
        self.init(corners: corners, border: border, borderType: borderType, radii: radii, content: { content })
    }

    public init(
        corners: RectCorner = RoundedCorner.defaultCorners,
        border: BorderConfiguration,
        borderType: BorderType = .default,
        radius: CGFloat,
        content: Content
    ) {
        self.init(corners: corners, border: border, borderType: borderType, radius: radius, content: { content })
    }
}

extension RoundedCornerView: View {
    public var body: some View {
        content()
            .rounderCorner(.init(radii: radii, corners: corners, layoutDirection: layoutDirection), border: border, borderType: borderType)
    }
}

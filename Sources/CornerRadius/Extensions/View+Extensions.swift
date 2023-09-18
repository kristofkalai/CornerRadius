//
//  View+Extensions.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import SwiftUI

extension View {
    public func rounderCorner(
        _ radius: CGFloat,
        corners: RectCorner = RoundedCorner.defaultCorners,
        isLeftToRight: Bool,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        rounderCorner(.init(radius: radius, corners: corners, isLeftToRight: isLeftToRight), border: border, borderType: borderType)
    }

    public func rounderCorner(
        _ radii: CGSize,
        corners: RectCorner = RoundedCorner.defaultCorners,
        isLeftToRight: Bool,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        rounderCorner(.init(radii: radii, corners: corners, isLeftToRight: isLeftToRight), border: border, borderType: borderType)
    }

    public func rounderCorner(
        _ radii: @escaping (CGRect) -> CGSize = RoundedCorner.defaultRadii,
        corners: RectCorner = RoundedCorner.defaultCorners,
        isLeftToRight: Bool,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        rounderCorner(.init(radii: radii, corners: corners, isLeftToRight: isLeftToRight), border: border, borderType: borderType)
    }
}

extension View {
    public func rounderCorner(
        _ radius: CGFloat,
        corners: RectCorner = RoundedCorner.defaultCorners,
        layoutDirection: LayoutDirection = RoundedCorner.defaultLayoutDirection,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        rounderCorner(radius, corners: corners, isLeftToRight: layoutDirection.isLeftToRight, border: border, borderType: borderType)
    }

    public func rounderCorner(
        _ radii: CGSize,
        corners: RectCorner = RoundedCorner.defaultCorners,
        layoutDirection: LayoutDirection = RoundedCorner.defaultLayoutDirection,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        rounderCorner(radii, corners: corners, isLeftToRight: layoutDirection.isLeftToRight, border: border, borderType: borderType)
    }

    public func rounderCorner(
        _ radii: @escaping (CGRect) -> CGSize = RoundedCorner.defaultRadii,
        corners: RectCorner = RoundedCorner.defaultCorners,
        layoutDirection: LayoutDirection = RoundedCorner.defaultLayoutDirection,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        rounderCorner(radii, corners: corners, isLeftToRight: layoutDirection.isLeftToRight, border: border, borderType: borderType)
    }
}

extension View {
    public func rounderCorner(
        _ roundedCorner: RoundedCorner,
        border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        clip(shape: roundedCorner, with: border, borderType: borderType)
    }
}

extension View {
    public func clip<T: Shape>(
        shape: T,
        with border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        let adjustedWidth = border.lineWidth / 2
        let adjustedSize = CGSize(width: adjustedWidth, height: adjustedWidth)
        return clipShape(shape)
            .padding(borderType == .external ? adjustedWidth : .zero)
            .overlay(shape.stroke(border: border).padding(borderType == .internal ? adjustedWidth : .zero))
            .padding(borderType == .external ? adjustedWidth : .zero)
    }
}

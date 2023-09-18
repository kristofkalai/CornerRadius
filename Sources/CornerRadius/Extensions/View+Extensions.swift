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
        let adjustedRoundedCornerForClipShape = RoundedCorner(radii: {
            let radii = roundedCorner.radii($0)
            if borderType == .external {
                return CGSize(width: radii.width - border.lineWidth / 2, height: radii.height - border.lineWidth / 2)
            }
            return radii
        }, corners: roundedCorner.corners, isLeftToRight: roundedCorner.isLeftToRight)
        let adjustedRoundedCornerForOverlay = RoundedCorner(radii: {
            let radii = roundedCorner.radii($0)
            if borderType == .internal {
                return CGSize(width: radii.width - border.lineWidth / 2, height: radii.height - border.lineWidth / 2)
            }
            return radii
        }, corners: roundedCorner.corners, isLeftToRight: roundedCorner.isLeftToRight)
        return clip(clipShape: adjustedRoundedCornerForClipShape, overlayShape: adjustedRoundedCornerForOverlay, with: border, borderType: borderType)
    }
}

extension View {
    public func clip<T: Shape>(
        shape: T,
        with border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        clip(clipShape: shape, overlayShape: shape, with: border, borderType: borderType)
    }
}

extension View {
    public func clip<T: Shape, S: Shape>(
        clipShape shape: T,
        overlayShape: S,
        with border: BorderConfiguration,
        borderType: BorderType = .default
    ) -> some View {
        let adjustedWidth = border.lineWidth / 2
        return clipShape(shape)
            .padding(borderType == .external ? adjustedWidth : .zero)
            .overlay(overlayShape.stroke(border: border).padding(borderType == .internal ? adjustedWidth : .zero))
            .padding(borderType == .external ? adjustedWidth : .zero)
    }
}

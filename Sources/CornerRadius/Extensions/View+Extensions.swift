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
        boderType: BorderType = .default
    ) -> some View {
        rounderCorner(.init(radius: radius, corners: corners, isLeftToRight: isLeftToRight), border: border, boderType: boderType)
    }

    public func rounderCorner(
        _ radii: CGSize,
        corners: RectCorner = RoundedCorner.defaultCorners,
        isLeftToRight: Bool,
        border: BorderConfiguration,
        boderType: BorderType = .default
    ) -> some View {
        rounderCorner(.init(radii: radii, corners: corners, isLeftToRight: isLeftToRight), border: border, boderType: boderType)
    }

    public func rounderCorner(
        _ radii: @escaping (CGRect) -> CGSize = RoundedCorner.defaultRadii,
        corners: RectCorner = RoundedCorner.defaultCorners,
        isLeftToRight: Bool,
        border: BorderConfiguration,
        boderType: BorderType = .default
    ) -> some View {
        rounderCorner(.init(radii: radii, corners: corners, isLeftToRight: isLeftToRight), border: border, boderType: boderType)
    }
}

extension View {
    public func rounderCorner(
        _ radius: CGFloat,
        corners: RectCorner = RoundedCorner.defaultCorners,
        layoutDirection: LayoutDirection = RoundedCorner.defaultLayoutDirection,
        border: BorderConfiguration,
        boderType: BorderType = .default
    ) -> some View {
        rounderCorner(radius, corners: corners, isLeftToRight: layoutDirection.isLeftToRight, border: border, boderType: boderType)
    }

    public func rounderCorner(
        _ radii: CGSize,
        corners: RectCorner = RoundedCorner.defaultCorners,
        layoutDirection: LayoutDirection = RoundedCorner.defaultLayoutDirection,
        border: BorderConfiguration,
        boderType: BorderType = .default
    ) -> some View {
        rounderCorner(radii, corners: corners, isLeftToRight: layoutDirection.isLeftToRight, border: border, boderType: boderType)
    }

    public func rounderCorner(
        _ radii: @escaping (CGRect) -> CGSize = RoundedCorner.defaultRadii,
        corners: RectCorner = RoundedCorner.defaultCorners,
        layoutDirection: LayoutDirection = RoundedCorner.defaultLayoutDirection,
        border: BorderConfiguration,
        boderType: BorderType = .default
    ) -> some View {
        rounderCorner(radii, corners: corners, isLeftToRight: layoutDirection.isLeftToRight, border: border, boderType: boderType)
    }
}

extension View {
    public func rounderCorner(
        _ roundedCorner: RoundedCorner,
        border: BorderConfiguration,
        boderType: BorderType = .default
    ) -> some View {
        clipShape(roundedCorner)
            .overlay(roundedCorner.stroke(border: border))
            .padding(boderType.padding(borderWidth: border.lineWidth))
    }
}

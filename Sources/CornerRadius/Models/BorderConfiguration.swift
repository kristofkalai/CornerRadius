//
//  BorderConfiguration.swift
//
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import UIKit
import SwiftUI

public struct BorderConfiguration {
    let borderColor: Color
    let lineWidth: CGFloat
    let lineCap: CGLineCap
    let lineJoin: CGLineJoin
    let miterLimit: CGFloat
    let dash: [CGFloat]
    let dashPhase: CGFloat

    public init(
        borderColor: Color,
        lineWidth: CGFloat = 1,
        lineCap: CGLineCap = .butt,
        lineJoin: CGLineJoin = .miter,
        miterLimit: CGFloat = 10,
        dash: [CGFloat] = .init(),
        dashPhase: CGFloat = .zero
    ) {
        self.borderColor = borderColor
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.dash = dash
        self.dashPhase = dashPhase
    }
}

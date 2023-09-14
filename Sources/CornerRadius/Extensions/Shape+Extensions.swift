//
//  Shape+Extensions.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import SwiftUI

extension Shape {
    func stroke(border: BorderConfiguration) -> some View {
        stroke(border.borderColor, style: StrokeStyle(
            lineWidth: border.lineWidth,
            lineCap: border.lineCap,
            lineJoin: border.lineJoin,
            miterLimit: border.miterLimit,
            dash: border.dash,
            dashPhase: border.dashPhase
        ))
    }
}

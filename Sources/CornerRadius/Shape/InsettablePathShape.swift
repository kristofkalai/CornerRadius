//
//  InsettablePathShape.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 18..
//

import SwiftUI

struct InsettablePathShape {
    let inset: CGSize
    let path: (CGRect) -> Path
}

extension InsettablePathShape: Shape {
    func path(in rect: CGRect) -> Path {
        path(rect.insetBy(dx: inset.width, dy: inset.height))
    }
}

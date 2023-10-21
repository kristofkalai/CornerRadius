//
//  Path+Extensions.swift
//
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import SwiftUI

extension Path {
    init(in rect: CGRect, byRoundingCorners corners: UIRectCorner, cornerRadii: CGSize, close: Bool) {
        let path = UIBezierPath(
            in: rect,
            byRoundingCorners: corners,
            cornerRadii: cornerRadii,
            close: close
        ).cgPath
        self.init(path)
    }
}

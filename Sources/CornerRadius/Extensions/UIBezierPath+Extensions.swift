//
//  UIBezierPath+Extensions.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import UIKit

extension UIBezierPath {
    convenience init(in rect: CGRect, byRoundingCorners corners: UIRectCorner, cornerRadii: CGSize, close: Bool) {
        self.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerRadii)
        if close {
            self.close()
        }
    }
}

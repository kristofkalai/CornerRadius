//
//  BorderType.swift
//  
//
//  Created by Kristóf Kálai on 2023. 09. 18..
//

import UIKit

public enum BorderType {
    case `default`
    case external
    case `internal`
}

extension BorderType {
    func padding(borderWidth: CGFloat) -> CGFloat {
        switch self {
        case .default: return .zero
        case .external: return borderWidth / 2
        case .internal: return -borderWidth / 2
        }
    }
}

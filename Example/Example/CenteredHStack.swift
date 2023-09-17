//
//  CenteredHStack.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 09. 18..
//

import SwiftUI

struct CenteredHStack<Content: View> {
    let content: () -> Content
}

extension CenteredHStack: View {
    var body: some View {
        HStack {
            Spacer()
            content()
            Spacer()
        }
    }
}

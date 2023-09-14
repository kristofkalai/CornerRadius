//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 09. 14..
//

import SwiftUI
import CornerRadius

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            roundedCornerView

            roundedCornerView
                .environment(\.layoutDirection, .leftToRight)

            roundedCornerView
                .environment(\.layoutDirection, .rightToLeft)
        }
        .padding()
    }

    private var roundedCornerView: some View {
        RoundedCornerView(
            corners: [.bottomTrailing, .topLeading],
            border: .init(borderColor: .blue, lineWidth: 5),
            radius: 25.0
        ) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .padding()
            .background(Color.red.opacity(0.5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

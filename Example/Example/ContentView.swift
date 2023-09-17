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
        ScrollView(showsIndicators: false) {
            CenteredHStack {
                VStack {
                    ForEach([BorderType.internal, .default, .external], id: \.self, content: forEachContent(_:))
                }
            }
        }
    }

    private func roundedCornerView(borderType: BorderType) -> some View {
        let content = VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
            .padding()
            .padding()
            .background(Color.red.opacity(0.5))

        let result = RoundedCornerView(
            corners: [.bottomTrailing, .topLeading],
            border: .init(borderColor: .blue, lineWidth: 5),
            borderType: borderType,
            radius: 25
        ) {
            content
        }

        // or the same:
        // let result = content
        //     .rounderCorner(25, corners: [.bottomTrailing, .topLeading], border: .init(borderColor: .blue, lineWidth: 5), borderType: borderType)

        return result.border(Color.green)
    }

    @ViewBuilder private func forEachContent(_ borderType: BorderType) -> some View {
        roundedCornerView(borderType: borderType)

        roundedCornerView(borderType: borderType)
            .environment(\.layoutDirection, .leftToRight)

        roundedCornerView(borderType: borderType)
            .environment(\.layoutDirection, .rightToLeft)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  ToastApp
//
//  Created by Anton Marchanka on 5/22/25.
//

import SwiftUI

struct ToastView: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .padding()
                .background(Color.blue)
                .clipShape(Capsule())
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView: View {
    var body: some View {
        Button {
            ToastService.shared.show(title: "My Message!")
        } label: {
            Text("Show the message")
        }
    }
}

#Preview {
    ContentView()
}

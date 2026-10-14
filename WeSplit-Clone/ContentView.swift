//
//  ContentView.swift
//  WeSplit-Clone
//
//  Created by Shubham Kashyap on 14/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "mail.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello! world")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

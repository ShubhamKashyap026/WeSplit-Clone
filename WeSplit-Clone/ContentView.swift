//
//  ContentView.swift
//  WeSplit-Clone
//
//  Created by Shubham Kashyap on 14/10/26.
//

import SwiftUI

// Think of the State as a person, and the View as a mirror.
// You cannot reach into a mirror and manually move the reflection's arm.
// The only way to change the reflection is for the actual person (the State) to move their arm. The mirror (the View) automatically updates to reflect whatever the person is doing.


// Swift UI is Declartive way
// UIKit is Imperative way

struct ContentView: View {
    // Properties
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentageOptions = [10, 15, 20, 50, 100, 0]
    
    var body: some View {
        Form {
            TextField("Enter you amount", value: $checkAmount, format: .currency(code: "INR"))
        }
    }
}

#Preview {
    ContentView()
}

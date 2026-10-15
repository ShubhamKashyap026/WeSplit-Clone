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


// Extension
extension Double {
    func limitToTwoDecimal() -> String {
        return self.formatted(.number.precision(.fractionLength(2)))
    }
}

struct ContentView: View {
    // Properties
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentageOptions = [10, 15, 20, 50, 100, 0]
    
    var finalOutputValues: (grandTotalAmountValue: String, amountPerPersonValue: String) {
        let grandTotalAmountValue = checkAmount + ((Double(tipPercentage) / 100) * checkAmount)
        let amountPerPersonValue = grandTotalAmountValue / Double(numberOfPeople)
        
        
        return (grandTotalAmountValue.limitToTwoDecimal(), amountPerPersonValue.limitToTwoDecimal())
    }
    
    var body: some View {
        Form {
            
            // Bill amount
            Section("Bill amount") {
                TextField("Enter you amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                    .keyboardType(.decimalPad)
            }
            
            // Number of people
            Section("Number of people") {
                Picker("Pick number", selection: $numberOfPeople) {
                    ForEach(2..<20) { num in
                        Text("\(num)")
                    }
                }
            }
            
            // Tip Logic
            Section("Tip percentage") {
                Picker("Select tip", selection: $tipPercentage) {
                    ForEach(tipPercentageOptions, id: \.self) { num in
                        Text("\(num)")
                    }
                }
                .pickerStyle(.segmented)

            }
            
            // Final output
            Section {
                Text("Grand total amount is: \(finalOutputValues.grandTotalAmountValue)")
                Text("Amount per person is: \(finalOutputValues.amountPerPersonValue)")
            }
            
        }
    }
}

#Preview {
    ContentView()
}

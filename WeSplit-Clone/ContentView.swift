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
    // Whenever an @State property changes, Swift re-invokes our body property
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var billAmountIsFocused: Bool
    let tipPercentageOptions = [10, 15, 20, 50, 100, 0]
    
    var finalOutputValues: (grandTotal: String, amountPerPerson: String) {
        let peopleCount = Double(numberOfPeople + 2) // I am doing this because the foreach loop starts 0 index item and our foreach loop starts at 2..<20 - 2 so the 2 item on index will 4 but number of people in computed property will 2. So adding this to offset and correct the value
        
        let grandTotalAmountValue = checkAmount + ((Double(tipPercentage) / 100) * checkAmount)
        let amountPerPersonValue = grandTotalAmountValue / peopleCount
        
        
        return (grandTotalAmountValue.limitToTwoDecimal(), amountPerPersonValue.limitToTwoDecimal())
    }
    
    var body: some View {
        
        NavigationStack {
            
            // Form
            Form {
                
                // Bill amount & Number of people
                Section("Bill amount") {
                    TextField("Enter you amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($billAmountIsFocused)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<20) { num in
                            Text("\(num)")
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                
                // Tip Logic
                Section("Tip percentage") {
                    Picker("Select tip", selection: $tipPercentage) {
                        ForEach(tipPercentageOptions, id: \.self) { num in
                            Text("\(num)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // Final output
                Section("Final output") {
                    Text("Grand total amount is: \(finalOutputValues.grandTotal)")
                    Text("Amount per person is: \(finalOutputValues.amountPerPerson)")
                }
                
            }
            
            .navigationTitle("We split clone")
            .toolbar {
                if billAmountIsFocused  {
                    Button("Done") {
                        billAmountIsFocused = false
                    }
                }
            }

        }
    }
}

#Preview {
    ContentView()
}

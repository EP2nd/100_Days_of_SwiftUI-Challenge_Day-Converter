//
//  ContentView.swift
//  UnitConverter
//
//  Created by Edwin Przeźwiecki Jr. on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    let lengthUnits = ["m", "km", "ft", "yd", "mi"]
    
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    @State private var inputValue = 0.0
    
    @FocusState private var amountIsFocused: Bool
    
    var outputValue: Double {
        
        let inputValueToMetersMultiplier: Double
        let metersToOutputValueMultiplier: Double
        
        switch inputUnit {
        case "km":
            inputValueToMetersMultiplier = 1000
        case "ft":
            inputValueToMetersMultiplier = 0.3048
        case "yd":
            inputValueToMetersMultiplier = 0.9144
        case "mi":
            inputValueToMetersMultiplier = 1609.344
        default:
            inputValueToMetersMultiplier = 1.0
        }
        
        switch outputUnit {
        case "km":
            metersToOutputValueMultiplier = 0.001
        case "ft":
            metersToOutputValueMultiplier = 3.280839895
        case "yd":
            metersToOutputValueMultiplier = 1.09361
        case "mi":
            metersToOutputValueMultiplier = 0.000621371
        default:
            metersToOutputValueMultiplier = 1.0
        }
        
        let inputValueToMeters = inputValue * inputValueToMetersMultiplier
        let metersToOutputValue = inputValueToMeters * metersToOutputValueMultiplier
        
        return metersToOutputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Choose your unit", selection: $inputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Initial value:")
                }
                Section {
                    Text(outputValue.formatted())
                    Picker("Choose your unit", selection: $outputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Converted value:")
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Length Units Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

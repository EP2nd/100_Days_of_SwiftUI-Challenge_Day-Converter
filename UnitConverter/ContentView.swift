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
    @State private var inputValue = Double(0)
    
    @FocusState private var amountIsFocused: Bool
    
    var outputValue: Double {
        var convertedValue = Double(0)
        var meters = Double(0)
        
        if inputUnit == outputUnit {
            convertedValue = inputValue
        } else if inputUnit == "m" && outputUnit == "km" {
            convertedValue = metersToKilometers(inputValue)
        } else if inputUnit == "m" && outputUnit == "ft" {
            convertedValue = metersToFeet(inputValue)
        } else if inputUnit == "m" && outputUnit == "yd" {
            convertedValue = metersToYards(inputValue)
        } else if inputUnit == "m" && outputUnit == "mi" {
            convertedValue = metersToMiles(inputValue)
        } else if inputUnit == "km" && outputUnit == "m" {
            convertedValue = kilometersToMeters(inputValue)
        } else if inputUnit == "km" && outputUnit == "ft" {
            meters = kilometersToMeters(inputValue)
            convertedValue = metersToFeet(meters)
        } else if inputUnit == "km" && outputUnit == "yd" {
            meters = kilometersToMeters(inputValue)
            convertedValue = metersToYards(meters)
        } else if inputUnit == "km" && outputUnit == "mi" {
            meters = kilometersToMeters(inputValue)
            convertedValue = metersToMiles(meters)
        } else if inputUnit == "ft" && outputUnit == "m" {
            convertedValue = feetToMeters(convertedValue)
        } else if inputUnit == "ft" && outputUnit == "km" {
            meters = feetToMeters(inputValue)
            convertedValue = metersToKilometers(meters)
        } else if inputUnit == "ft" && outputUnit == "yd" {
            meters = feetToMeters(inputValue)
            convertedValue = metersToYards(meters)
        } else if inputUnit == "ft" && outputUnit == "mi" {
            meters = feetToMeters(inputValue)
            convertedValue = metersToMiles(meters)
        } else if inputUnit == "yd" && outputUnit == "m" {
            convertedValue = yardsToMeters(inputValue)
        } else if inputUnit == "yd" && outputUnit == "km" {
            meters = yardsToMeters(inputValue)
            convertedValue = metersToKilometers(meters)
        } else if inputUnit == "yd" && outputUnit == "ft" {
            meters = yardsToMeters(inputValue)
            convertedValue = metersToFeet(meters)
        } else if inputUnit == "yd" && outputUnit == "mi" {
            meters = yardsToMeters(inputValue)
            convertedValue = metersToMiles(meters)
        } else if inputUnit == "mi" && outputUnit == "m" {
            convertedValue = milesToMeters(inputValue)
        } else if inputUnit == "mi" && outputUnit == "km" {
            meters = milesToMeters(inputValue)
            convertedValue = metersToKilometers(meters)
        } else if inputUnit == "mi" && outputUnit == "ft" {
            meters = milesToMeters(inputValue)
            convertedValue = metersToFeet(meters)
        } else if inputUnit == "mi" && outputUnit == "yd" {
            meters = milesToMeters(inputValue)
            convertedValue = metersToYards(meters)
        }
        return convertedValue
    }
    
    func kilometersToMeters(_ inputValue: Double) -> Double {
        inputValue * 1000
    }
    
    func feetToMeters(_ inputValue: Double) -> Double {
        inputValue * 0.3048
    }
    
    func yardsToMeters(_ inputValue: Double) -> Double {
        inputValue * 0.9144
    }
    
    func milesToMeters(_ inputValue: Double) -> Double {
        inputValue * 1609.344
    }
    
    func metersToKilometers(_ inputValue: Double) -> Double {
        inputValue / 1000
    }
    
    func metersToFeet(_ inputValue: Double) -> Double {
        inputValue * 3.280839895
    }
    
    func metersToYards(_ inputValue: Double) -> Double {
        inputValue / 0.9144
    }
    
    func metersToMiles(_ inputValue: Double) -> Double {
        inputValue / 1609.344
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
            .navigationTitle("UnitConverter")
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

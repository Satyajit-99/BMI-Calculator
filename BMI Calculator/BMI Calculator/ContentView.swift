//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Satyajit Bhol on 14/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: Double? = nil

    // Computed property to get BMI color
    private var bmiColor: Color {
        guard let bmi = bmi else { return .clear }
        if bmi >= 0 && bmi <= 18.5 {
            return .yellow
        } else if bmi > 18.5 && bmi <= 24.9 {
            return .green
        } else if bmi > 24.9 {
            return .red
        } else {
            return .clear
        }
    }
    
    // Computed property to get BMI category
    private var bmiCategory: String {
        guard let bmi = bmi else { return "" }
        if bmi >= 0 && bmi <= 18.5 {
            return "Underweight"
        } else if bmi > 18.5 && bmi <= 24.9 {
            return "Normal"
        } else if bmi > 24.9 {
            return "Obese"
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("BMI Calculator")
                .font(.largeTitle)
                .padding()

            // Input for weight
            TextField("Enter weight (kg)", text: $weight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Input for height
            TextField("Enter height (m)", text: $height)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("*Enter the height in meter only.")
            
            // Calculate Button
            Button(action: calculateBMI) {
                Text("Calculate BMI")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Display BMI
            if let bmi = bmi {
                VStack {
                    Text("Your BMI: \(String(format: "%.2f", bmi))")
                        .font(.title2)
                        .padding()
                        .background(bmiColor.opacity(0.7)) // Apply color based on BMI
                        .cornerRadius(10)
                    
                    Text("Category: \(bmiCategory)")
                        .font(.headline)
                        .padding()
                        .background(bmiColor.opacity(0.7))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
            }

            Spacer()
        }
        .padding()
    }
    
    // Function to calculate BMI
    private func calculateBMI() {
        guard let weight = Double(weight), let height = Double(height), height > 0 else {
            return
        }
        bmi = weight / (height * height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  RetirementCalculatorView.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 9/02/25.
//

import SwiftUI
import AppCenterCrashes

struct RetirementCalculatorView: View {
    @State private var monthlyInvestments: String = ""
    @State private var age: String = ""
    @State private var retirementAge: String = ""
    @State private var interestRate: String = ""
    @State private var savings: String = ""
    @State private var result: String = "Ingrese los valores y presione calcular"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Calculadora de Retiro")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Inversión mensual:")
                    TextField("Ej. 500", text: $monthlyInvestments)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    
                    Text("Edad actual:")
                    TextField("Ej. 30", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    Text("Edad de retiro:")
                    TextField("Ej. 65", text: $retirementAge)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    Text("Tasa de interés anual (%):")
                    TextField("Ej. 5.0", text: $interestRate)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    
                    Text("Ahorros actuales:")
                    TextField("Ej. 10000", text: $savings)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                .padding()

                Button(action: {
                    Crashes.generateTestCrash()
                }) {
                    Text("Calcular")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Text(result)
                    .font(.headline)
                    .padding()

                Spacer()
            }
            .padding()
            .navigationTitle("Retiro")
        }
    }
}

#Preview {
    RetirementCalculatorView()
}

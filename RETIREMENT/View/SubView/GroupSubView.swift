//
//  GroupSubView.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 29/03/25.
//

import SwiftUI

struct GroupSubView: View {
    
    // MARK: - PROPERTIES
    @Binding var monthlyInvestments: String
    @Binding var age: String
    @Binding var retirementAge: String
    @Binding var interestRate: String
    @Binding var expectedReturn: String
    @Binding var savings: String
    
    // MARK: - DESIGNATED INITIALIZER
    init(monthlyInvestments: Binding<String>, age: Binding<String>,
         retirementAge: Binding<String>, interestRate: Binding<String>,
         expectedReturn: Binding<String>, savings: Binding<String>) {
        self._monthlyInvestments = monthlyInvestments
        self._age = age
        self._retirementAge = retirementAge
        self._interestRate = interestRate
        self._expectedReturn = expectedReturn
        self._savings = savings
    }
    
    // MARK: - BODY
    var body: some View {
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
    }
}


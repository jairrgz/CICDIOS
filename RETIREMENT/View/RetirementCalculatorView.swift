//
//  RetirementCalculatorView.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 9/02/25.
//

import SwiftUI
import AppCenterCrashes
import AppCenterAnalytics
import AppCenterAnalytics

struct RetirementCalculatorView: View {
    
    // MARK: - PROPERTIES
    @State private var monthlyInvestments: String = ""
    @State private var age: String = ""
    @State private var retirementAge: String = ""
    @State private var interestRate: String = ""
    @State private var savings: String = ""
    @State private var result: String = "Ingrese los valores y presione calcular"
    @State private var expectedReturn: String = ""
    
    // MARK: - DESIGNATED INITIALIZER
    init(monthlyInvestments: String, age: String,
         retirementAge: String, interestRate: String,
         savings: String, result: String, expectedReturn: String) {
        self.monthlyInvestments = monthlyInvestments
        self.age = age
        self.retirementAge = retirementAge
        self.interestRate = interestRate
        self.savings = savings
        self.result = result
        self.expectedReturn = expectedReturn
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Calculadora de Retiro")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                GroupSubView(monthlyInvestments: $monthlyInvestments,
                             age: $age,
                             retirementAge: $retirementAge,
                             interestRate: $interestRate,
                             expectedReturn: $expectedReturn,
                             savings: $savings)

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
        .onAppear {
            Analytics.trackEvent("My custom event")
        }
    }
}


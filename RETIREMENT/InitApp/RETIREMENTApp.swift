//
//  RETIREMENTApp.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 9/02/25.
//

import SwiftUI
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterCrashes


@main
struct RETIREMENTApp: App {
    
    init() {
       
        AppCenter.logLevel = .verbose
        AppCenter.start(withAppSecret: "d9ecd2cf-eb7e-472f-864c-6709d0e3cf81", services:[
            Analytics.self,
            Crashes.self
        ])
        
        Crashes.enabled = true
        Analytics.enabled = true
        
    }
    
    var body: some Scene {
        WindowGroup {
            RetirementCalculatorView(monthlyInvestments: "", age: "", retirementAge: "", interestRate: "", savings: "", result: "", expectedReturn: "")
        }
    }
}

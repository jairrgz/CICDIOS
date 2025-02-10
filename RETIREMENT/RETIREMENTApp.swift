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

@main
struct RETIREMENTApp: App {
    
    init() {
        AppCenter.start(withAppSecret: "910aa33c-9dec-4e13-91e7-711b0db06443", services:[
            Analytics.self,
            Crashes.self
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//
//  ContentView.swift
//  CICD
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 3/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

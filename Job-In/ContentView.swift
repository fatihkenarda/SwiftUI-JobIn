//
//  ContentView.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    var body: some View {
        VStack {
            FormField(icon: "envelope.fill", placeHolder: "Email", value: $email)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

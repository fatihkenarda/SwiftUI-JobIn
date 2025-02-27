//
//  ButtonModifiers.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {
    
    func body(content: Content) -> some View{
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold))
            .background(Color.black)
            .cornerRadius(5.0)
    }
}



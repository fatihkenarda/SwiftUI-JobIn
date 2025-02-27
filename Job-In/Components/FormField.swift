//
//  FormField.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import SwiftUI

struct FormField: View {
    var icon: String
    var placeHolder: String
    var isSecure = false
    
    @Binding var value: String	
    
    var body: some View {
        Group{
            HStack{
                Image(systemName: icon)
                    .padding()
                Group{
                    if isSecure {
                        SecureField(placeHolder, text: $value)
                    }else{
                        TextField(placeHolder, text: $value)
                    }
                }.font(Font.system(size: 20, design: .monospaced))
                    .foregroundColor(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }.overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 4)).padding()
        }
    }
}


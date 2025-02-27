//
//  SignInView.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Spacer(minLength: 100)
                VStack(spacing: 20){
                    Image("ImageSignIn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .cornerRadius(50)
                        .overlay(RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 4)).padding()
                    
                    VStack(alignment:.leading){
                        Text("Welcome Back")
                            .font(.system(size: 32, weight: .heavy))
                        
                        Text("Sign In To Continue")
                            .font(.system(size: 16, weight: .medium))
                    }
                
                    FormField(icon: "envelope.fill", placeHolder: "Email", value: $email)
                    FormField(icon: "lock.fill", placeHolder: "Password", isSecure: true, value: $password)
                    Button(action: {}){
                        Text("Sign In")
                            .font(.title)
                            .modifier(ButtonModifiers())
                    }
                    
                    HStack{
                        Text("New?")
                        NavigationLink(destination: SignUpView()){
                            Text("Create an Account.")
                                .font(.system(size: 20, weight: .semibold))
                        }
                    }

                }.padding()
            }
            .ignoresSafeArea()
            .background(Color("backColor"))
        }
    }
}
/*
#Preview {
    SignInView()
}
*/

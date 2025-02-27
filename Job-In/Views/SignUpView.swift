//
//  SignUpView.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var pickedImage: UIImage?
    @State private var profileImage: UIImage?
    @State private var showActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data? = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String =  ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No"
    
    func loadImage(){
        guard let inputImage = pickedImage else {
            return
        }
        profileImage = inputImage
    }
    
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty ||
            username.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData!.isEmpty{
            
            return "Please Fill in all fields and provide an image"
        }
        return nil
    }
    
    func clear(){
        self.username = ""
        self.password = ""
        self.email = ""
    }
    
    func signUp(){
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        AuthService.signUp(username: username, email: email, password: password, imageData: imageData!,
                           onSuccess: {
            (user) in
            self.clear()
        }) {
            (errorMessage) in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
    var body: some View {
        ScrollView{
            Spacer(minLength: 100)
            VStack(spacing: 20){
                
                VStack(alignment:.leading){
                    Text("Welcome")
                        .font(.system(size: 32, weight: .heavy))
                    
                    Text("Sign Up To Start")
                        .font(.system(size: 16, weight: .medium))
                }
                
                VStack{
                    Group{
                        if profileImage != nil {
                            Image(uiImage: (profileImage)!)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 120, height: 120)
                                .padding(.top,20)
                                .onTapGesture {
                                    self.showActionSheet = true
                                }
                        }
                        else{
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 120, height: 100)
                                .padding(.top,20)
                                .onTapGesture {
                                    self.showActionSheet = true
                                }
                        }
                    }
                }

                FormField(icon: "person.fill", placeHolder: "Username", value: $username)
                FormField(icon: "envelope.fill", placeHolder: "Email", value: $email)
                FormField(icon: "lock.fill", placeHolder: "Password", isSecure: true, value: $password)
                Button(action: signUp){
                    Text("Sign Up")
                        .font(.title)
                        .modifier(ButtonModifiers())
                }.alert(isPresented: $showingAlert){
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                }
                
            }.padding()
        }
        .ignoresSafeArea()
        .background(Color("backColor"))
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text(""), buttons: [
                .default(Text("Choose A Photo")){
                    self.sourceType = .photoLibrary
                    self.showingImagePicker = true
                },
                .default(Text("Take A Photo")){
                    self.sourceType = .camera
                    self.showingImagePicker = true
                },
                .cancel()
            ])
        }
        
    }
}

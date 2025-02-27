//
//  ImagePicker.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var pickedImage: UIImage?
    @Binding var showImagePicker: Bool
    @Binding var imageData: Data?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                    if let uiImage = info[.editedImage] as? UIImage {
                        parent.pickedImage = uiImage
                        parent.imageData = uiImage.jpegData(compressionQuality: 0.8)
                    }
                    parent.showImagePicker = false
                }
        
    
    }
}

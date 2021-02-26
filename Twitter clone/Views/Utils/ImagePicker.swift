//
//  ImagePicker.swift
//  Twitter clone
//
//  Created by macbook on 2/26/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    // MARK: - Methods
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Conforming to the UIViewControllerRepresentable Protocol
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        /*
         - We don't need this method
         - However, it is part of the UIViewControllerRepresentable protocol so we HAVE to implement it
         - This gets called when updating the UI
         */
    }
}

// MARK: - Extansion

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Method that gets executed when an image gets selected from the Image Picker
             
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.image = image
            parent.mode.wrappedValue.dismiss()
        }
    }
}

/*
**  SwiftUI doesn't have anything like an ImagePicker yet, so we need to implement one using UIKit  **
 
 Here we use a UIViewControllerRepresentable, to transform a UIKit ViewController into a SwiftUI View:
 
    - It extracts the View components from a ViewController, and renders them in a SwiftUI friendly way.
    
    - The required "makeUIViewController" method takes care of creating that ViewController and returning it
        - That why we create the picker property here
 
    - The required "updateUIViewController" method takes care of updating that VC
        - In this case we are not implementing anythig in here
 
    - The Coordinator helps fill the gap between UIKit and SwiftUI
        - Need more info on this..
 
    - The parent variable in the Coordinator:
        - It refers to the parent view of the ImagePicker (this UIViewControllerRepresentable)
 */

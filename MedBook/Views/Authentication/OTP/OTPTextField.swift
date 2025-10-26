//
//  OTPTextField.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 26.10.25.
//

import Foundation
import SwiftUI

struct OTPTextField: UIViewRepresentable {
    
    @Binding var text: String
    var onDeleteBackward: (() -> Void)? = nil
    
    func makeUIView(context: Context) -> UITextField {
        let textField = BackspaceTextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged), for: .editingChanged)
        context.coordinator.parent = self
        textField.onDeleteBackward = {
            onDeleteBackward?()
        }
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: OTPTextField
        init(parent: OTPTextField) { self.parent = parent }
        
//        @objc func textChanged(_ textField: UITextField) {
//            if let newText = textField.text, newText.count <= 1 {
//                parent.text = newText
//            } else if let newText = textField.text, newText.count > 1 {
//                parent.text = String(newText.prefix(1))
//            }
//        }
        @objc func textChanged(_ textField: UITextField) {
            if let text = textField.text {
                let limited = String(text.prefix(1))
                if text != limited {
                    textField.text = limited
                }
                parent.text = limited
            }
        }

    }
    
    class BackspaceTextField: UITextField {
        var onDeleteBackward: (() -> Void)?
        override func deleteBackward() {
            onDeleteBackward?()
            super.deleteBackward()
        }
    }
}

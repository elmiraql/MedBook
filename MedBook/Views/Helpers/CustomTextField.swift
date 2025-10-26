//
//  CustomTextField.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 16.10.25.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String?
    let placeholder: String
    let icon: String?
    let height: CGFloat
    
    @Binding var text: String

    init(
        title: String? = nil,
        placeholder: String,
        text: Binding<String>,
        icon: String? = nil, height: CGFloat
    ) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.icon = icon
        self.height = height
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title = title {
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(.sRGB, red: 0.19, green: 0.21, blue: 0.28, opacity: 1))
            }
            HStack {
                TextField(placeholder, text: $text)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.vertical, 12)
                    .padding(.leading, 12)
                    .frame(height: height)
                if let iconName = icon {
                    Image(systemName: iconName)
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color(.systemGray5), lineWidth: 1)
            )
        }
        .padding(.horizontal)
    }
}



//#Preview {
//    CustomTextField(title: "", placeholder: "", text: "", icon: "")
//}

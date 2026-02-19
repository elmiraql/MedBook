//
//  RoundedActionButton.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import SwiftUI

struct RoundedActionButton: View {
    
    let title: String
    let backgroundColor: Color
    let textColor: Color
    let height: CGFloat
    let isEnabled: Bool
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, maxHeight: height)
                .background(backgroundColorForState)
                .cornerRadius(height / 2)
        }
        .disabled(!(isEnabled))
    }
    
    private var backgroundColorForState: Color {
            isEnabled ? backgroundColor : Color.gray
        }
}


//#Preview {
//    RoundedActionButton(title: "title", backgroundColor: .blue, textColor: .white, width: 100, height: 60, action: {
//        print("hello")
//    })
//}

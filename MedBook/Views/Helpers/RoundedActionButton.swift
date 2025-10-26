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
        var action: () -> Void //= {print("print smth")}
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, maxHeight: height)
                .background(backgroundColor)
                .cornerRadius(height / 2)
        }
        
    }
}


//#Preview {
//    RoundedActionButton(title: "title", backgroundColor: .blue, textColor: .white, width: 100, height: 60, action: {
//        print("hello")
//    })
//}

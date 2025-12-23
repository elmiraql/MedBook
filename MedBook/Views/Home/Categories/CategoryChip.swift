//
//  CategoryChip.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 23.12.25.
//

import SwiftUI

struct CategoryChip: View {
    
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.black : Color.clear)
                .foregroundColor(isSelected ? .white : .black)
                .overlay(
                    Capsule()
                        .stroke(Color.black, lineWidth: 1)
                )
                .clipShape(Capsule())
        }
    }
}

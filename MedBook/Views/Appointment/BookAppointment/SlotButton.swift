//
//  SlotButton.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 19.02.26.
//

import SwiftUI

struct SlotButton: View {
    
    let slot: TimeSlot
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            Text(slot.time)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundStyle(textColor)
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .disabled(!slot.isAvailable)
    }
    
    private var backgroundColor: Color {
        if !slot.isAvailable {
            return Color.gray.opacity(0.4)
        } else if isSelected {
            return Color.black
        } else {
            return Color.gray.opacity(0.06)
        }
    }
    
    private var textColor: Color {
        if !slot.isAvailable {
            return Color.gray
        } else if isSelected {
            return Color.white
        } else {
            return Color(hex: "6B7280")
        }
    }
}


#Preview {
    SlotButton(slot: TimeSlot(id: "id", time: "5.30 PM", isAvailable: true), isSelected: false, action: {})
}

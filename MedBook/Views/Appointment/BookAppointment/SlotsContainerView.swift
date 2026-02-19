//
//  SlotsContainerView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 19.02.26.
//

import SwiftUI

struct SlotsContainerView: View {
    
    let slots: [TimeSlot]
    @State private var selectedSlot: TimeSlot?
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text("Select hour")
                .font(.title3.bold())
//                .foregroundStyle(.white)
//                .padding(.horizontal, 24)
                .padding(.top, 24)
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(slots) { slot in
                    SlotButton(
                        slot: slot,
                        isSelected: selectedSlot?.id == slot.id
                    ) {
                        selectedSlot = slot
                    }
                }
            }
//            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
//        .background(.ultraThinMaterial)
//        .clipShape(RoundedRectangle(cornerRadius: 28))
//        .shadow(color: .black.opacity(0.25), radius: 32, y: 16)
//        .padding(.horizontal, 20)
    }
}

#Preview {
    SlotsContainerView(slots: [TimeSlot(id: "", time: "09.00 AM", isAvailable: true)])
}


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
    let isLoading: Bool
    let errorMessage: String?
    let onSlotSelected: (TimeSlot?) -> Void
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Select hour")
                .font(.title3.bold())
                .padding(.top, 16)            
            
            if isLoading {
                Spacer()
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            } else if slots.isEmpty {
                Text("No slots available yet")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            } else {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(slots) { slot in
                        SlotButton(
                            slot: slot,
                            isSelected: selectedSlot?.id == slot.id
                        ) {
                            selectedSlot = slot
                            onSlotSelected(slot)
                        }
                    }
                }
                .padding(.bottom, 24)
            }
            
        }
        
    }
}

#Preview {
    SlotsContainerView(slots: [TimeSlot(id: "d1_1", time: "09.00 AM", isAvailable: false)], isLoading: false, errorMessage: nil, onSlotSelected: {_ in})
}


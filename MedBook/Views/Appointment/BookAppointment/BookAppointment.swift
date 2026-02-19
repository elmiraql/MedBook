//
//  BookAppointment.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 18.02.26.
//

import SwiftUI

struct BookAppointment: View {
    
    var doctorId: String
    @StateObject private var viewModel: BookingViewModel
    @State private var selectedSlot: TimeSlot?
    
    init(doctorId: String) {
        _viewModel = StateObject(wrappedValue: BookingViewModel(doctorId: doctorId))
        self.doctorId = doctorId
    }
    
    var body: some View {
      
        ScrollView {
            VStack {
                Text("Select date")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ScheduleView { date in
                    print("date selected: \(date)")
                    Task { await viewModel.selectDate(date) }
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 28))
                .shadow(
                    color: Color.black.opacity(0.25),
                    radius: 32,
                    x: 0,
                    y: 16
                )
                
                SlotsContainerView(slots: viewModel.slots, isLoading: viewModel.isLoading, errorMessage: viewModel.errorMessage, onSlotSelected: { slot in
                    selectedSlot = slot
                })
            }
            
            .padding(.horizontal)
           
        }
        .navigationTitle("Book appointment")
        .safeAreaInset(edge: .bottom, spacing: 0) {
            RoundedActionButton(title: "Confirm", backgroundColor: .black, textColor: .white, height: 60, isEnabled: selectedSlot != nil) {

            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BookAppointment(doctorId: "doc_003")
}

//
//  BookingViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 19.02.26.
//

import Foundation

@MainActor
class BookingViewModel: ObservableObject {
    
    let doctorId: String
    
    @Published var slots: [TimeSlot] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
        
    init(doctorId: String) {
        self.doctorId = doctorId
        Task { await loadSlots() }
    }
    
    private func loadSlots() async {
        
        await MainActor.run{
            isLoading = true
            errorMessage = nil
        }
        
        do {
            let fetchedSlots = try await SlotService.shared.getSlots(doctorId: doctorId)
            await MainActor.run {
                self.slots = fetchedSlots
                isLoading = false
                print(fetchedSlots)
            }
        } catch {
            await MainActor.run {
                errorMessage = "\(error.localizedDescription)"
                isLoading = false
            }
        }
    }

}

//
//  SlotService.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 19.02.26.
//

import Foundation

actor SlotService {

    static let shared = SlotService()
    
    func getSlots(doctorId: String) async throws -> [TimeSlot] {
        
        let delaySeconds = Int.random(in: 1...2)
        try await Task.sleep(for: .seconds(delaySeconds))
        
        let allSlots: SlotsByDoctorResponse = load("slotsData.json")
        guard let doctorSlots = allSlots.slotsByDoctor[doctorId]?.slots
        else {
            throw NetworkError.noDataFound
        }
        
        return doctorSlots
    }
    
    
}

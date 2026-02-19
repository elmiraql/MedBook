//
//  TimeSlot.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 19.02.26.
//

import Foundation

struct SlotsByDoctorResponse: Codable {
    let slotsByDoctor: [String: DoctorSlots]
}

struct DoctorSlots: Codable {
    let date: String
    let slots: [TimeSlot]
}

struct TimeSlot: Codable, Identifiable {
    let id: String
    let time: String
    var isAvailable: Bool
    
    var displayTime: String { time }
}

//
//  Doctor.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 29.10.25.
//

import Foundation

struct Doctor: Identifiable, Codable, Hashable {
    let id = UUID()
    let doctorId: String
    let name: String
    let specialty: String
    let hospital: String
    let rating: Double
    let imageName: String
    let time: String
    let isFavorite: Bool
    let stats: [DoctorStat]?
    let about: String
    let consultationDays: String
}

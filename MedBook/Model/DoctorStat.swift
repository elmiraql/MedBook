//
//  DoctorStat.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 28.12.25.
//

import Foundation

struct DoctorStat: Identifiable, Hashable, Codable {
    let iconName: String
    let valueText: String
    let caption: String
    let id = UUID()
}


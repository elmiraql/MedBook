//
//  DoctorCategory.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 22.12.25.
//

import Foundation

struct DoctorCategory: Identifiable, Hashable, Decodable {
    let id: String
    let title: String
    let apiKey: String
}

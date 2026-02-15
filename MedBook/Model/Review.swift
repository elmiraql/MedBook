//
//  Review.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 09.02.26.
//

import Foundation

struct Review: Codable, Identifiable {
    let id = UUID()
    let text: String
    let author: String
    let stars: String
    let date: String
}

struct AllReviews: Codable {
    let reviews: [DoctorReviews]
}

struct DoctorReviews: Codable {
    let doctorId: String
    let reviews: [Review]
}

//
//  DoctorService.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 09.02.26.
//

import Foundation

actor DoctorService {
    
    static let shared = DoctorService()
    
    func getReviews(doctorId: String) async throws -> [Review] {

        let delaySeconds = Int.random(in: 1...2)
        try await Task.sleep(for: .seconds(delaySeconds))
        
        let allReviews: AllReviews = load("reviews.json")
        
        guard let doctorReviews = allReviews.reviews.first(where: { $0.doctorId == doctorId })?.reviews
        else {
            throw NetworkError.noDataFound
        }
        return doctorReviews
    }
}

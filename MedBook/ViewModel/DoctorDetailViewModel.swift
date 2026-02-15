//
//  DoctorDetailViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 09.02.26.
//

import Foundation

@MainActor
class DoctorDetailViewModel: ObservableObject {
    
    let doctor: Doctor
    
    @Published var reviews: [Review] = []
    @Published var isLoadingReviews = false
    @Published var errorMessage: String?
    
    init(doctor: Doctor) {
        self.doctor = doctor
        Task { await loadReviews() }
    }
    
    private func loadReviews() async {
        
        await MainActor.run {
            isLoadingReviews = true
            errorMessage = nil
        }
        
        do {
            let fetchedReviews = try await DoctorService.shared.getReviews(doctorId: doctor.doctorId)
            await MainActor.run {
                self.reviews = fetchedReviews
                isLoadingReviews = false
            }
        } catch {
            await MainActor.run {
                errorMessage = "\(error.localizedDescription)"
                isLoadingReviews = false
            }
        }
    }
}

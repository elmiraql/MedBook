//
//  HomeModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import Foundation

class HomeViewModel: ObservableObject, Hashable {
    
    @Published var appointments: [Appointment] = load("appointments.json")
    @Published var categories: [Category] = load("categories.json")
    @Published var doctors: [Doctor] = load("doctors.json")
    @Published var doctorCategories: [DoctorCategory] = load("doctorCategories.json")
    
    let id = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: HomeViewModel, rhs: HomeViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
}


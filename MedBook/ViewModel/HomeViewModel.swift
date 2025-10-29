//
//  HomeModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var appointments: [Appointment] = load("appointments.json")
    @Published var categories: [Category] = load("categories.json")
    @Published var doctors: [Doctor] = load("doctors.json")
    
}


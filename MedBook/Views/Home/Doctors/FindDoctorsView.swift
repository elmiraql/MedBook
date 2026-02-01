//
//  FindDoctorsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 29.10.25.
//

import SwiftUI

struct FindDoctorsView: View {
    
    let doctors: [Doctor]
    
    var body: some View {
            
            VStack(alignment: .leading) {
               
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(doctors) { doctor in
                            DoctorCard(doctor: doctor)
                        }
                    }
//                    .onAppear {
//                        print(nil == .none)
//                    }
                }
            }
    }
    
}


#Preview {
    FindDoctorsView(doctors:  [
        Doctor(name: "Jennifer Miller", specialty: "Pediatrician", hospital: "Mercy Hospital", rating: 4.8, imageName: "jennifer", time: "10:30am - 5:30pm", isFavorite: false, stats: []),
        Doctor(name: "Robert Johnson", specialty: "Neurologist", hospital: "ABC hospital", rating: 4.8, imageName: "robert", time: "10:30am - 5:30pm", isFavorite: true, stats: []),
        Doctor(name: "Laura White", specialty: "Dentist", hospital: "Cedar Dental care", rating: 4.8, imageName: "laura", time: "10:30am - 5:30pm", isFavorite: false, stats: []),
        Doctor(name: "Brian Clark", specialty: "Psychiatrist", hospital: "ABC hospital", rating: 4.8, imageName: "brian", time: "10:30am - 5:30pm", isFavorite: false, stats: [])
    ])
}

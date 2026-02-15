//
//  FindDoctorsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 29.10.25.
//

import SwiftUI

struct FindDoctorsView: View {
    
    let doctors: [Doctor]
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
            
            VStack(alignment: .leading) {
               
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(doctors) { doctor in
                            Button {
                                router.navigate(to: .doctorDetails(doctor: doctor))
                            }label: {
                                DoctorCard(doctor: doctor)
                            }
                            .buttonStyle(.plain)
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
        Doctor(doctorId: "", name: "Jennifer Miller", specialty: "Pediatrician", hospital: "Mercy Hospital", rating: 4.8, imageName: "jennifer", time: "10:30am - 5:30pm", isFavorite: false, stats: [], about: "", consultationDays: "Friday: 09:00 AM - 01:00 PM"),
        Doctor(doctorId: "", name: "Robert Johnson", specialty: "Neurologist", hospital: "ABC hospital", rating: 4.8, imageName: "robert", time: "10:30am - 5:30pm", isFavorite: true, stats: [], about: "", consultationDays: "Friday: 09:00 AM - 01:00 PM"),
        Doctor(doctorId: "", name: "Laura White", specialty: "Dentist", hospital: "Cedar Dental care", rating: 4.8, imageName: "laura", time: "10:30am - 5:30pm", isFavorite: false, stats: [], about: "", consultationDays: "Friday: 09:00 AM - 01:00 PM"),
        Doctor(doctorId: "", name: "Brian Clark", specialty: "Psychiatrist", hospital: "ABC hospital", rating: 4.8, imageName: "brian", time: "10:30am - 5:30pm", isFavorite: false, stats: [], about: "", consultationDays: "Friday: 09:00 AM - 01:00 PM")
    ])
}

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
//        GeometryReader { geo in
            
//            let cardHorizontalPadding: CGFloat = 16
//            let cardWidth = geo.size.width - cardHorizontalPadding * 2
//            let cardHeight = cardWidth * 0.40
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Find Doctors")
                        .font(.title2).bold()
                    Spacer()
                    Button("See all") { }
                        .foregroundColor(Color.blue)
                }
                .padding(.bottom, 8)
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(doctors) { doctor in
                            DoctorCard(doctor: doctor)
//                                .padding(.horizontal, 8)
//                                .frame(width: cardWidth, height: cardHeight)
                        }
                    }
                    //.padding(.top, 2)
                }
            }
//        }
    }
}


#Preview {
    FindDoctorsView(doctors:  [
        Doctor(name: "Jennifer Miller", specialty: "Pediatrician", hospital: "Mercy Hospital", rating: 4.8, imageName: "jennifer", time: "10:30am - 5:30pm", isFavorite: false),
        Doctor(name: "Robert Johnson", specialty: "Neurologist", hospital: "ABC hospital", rating: 4.8, imageName: "robert", time: "10:30am - 5:30pm", isFavorite: true),
        Doctor(name: "Laura White", specialty: "Dentist", hospital: "Cedar Dental care", rating: 4.8, imageName: "laura", time: "10:30am - 5:30pm", isFavorite: false),
        Doctor(name: "Brian Clark", specialty: "Psychiatrist", hospital: "ABC hospital", rating: 4.8, imageName: "brian", time: "10:30am - 5:30pm", isFavorite: false)
    ])
}

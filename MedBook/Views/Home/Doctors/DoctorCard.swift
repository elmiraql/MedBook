//
//  DoctorCard.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 29.10.25.
//

import SwiftUI

struct DoctorCard: View {
    
    var isFavorite: Bool = false
    let doctor: Doctor
    
    var body: some View {
        GeometryReader { geo in
            
            let cardHorizontalPadding: CGFloat = 16
            let cardWidth = geo.size.width - cardHorizontalPadding * 2
            let cardHeight = cardWidth * 0.40
            let buttonHeight = cardHeight * 0.35
            
            VStack {
                HStack(alignment: .top) {
                    Image(doctor.imageName)
                    //                    .resizable()
                    //                    .frame(width: 44, height: 44)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text(doctor.name)
                            .font(.headline)
                        
                        Text("\(doctor.specialty) | \(doctor.hospital)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text(String(doctor.rating))
                                .fontWeight(.bold)
                            
                            Image("Star")
                            Image("Calender")
                                .padding(.leading)
                            Text(doctor.time)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer()
                    Image(isFavorite ? "Favorite_fill" : "Favorite_empty")
                }
                
                RoundedActionButton(title: "Book Appointment", backgroundColor: Color(.lightBlue), textColor: Color(.primaryBlue), height: buttonHeight, isEnabled: true) {
                    
                }
            }
            .frame(width: cardWidth, height: cardHeight)
            .padding()
            .background(Color(.lightGray))
            .cornerRadius(18)
            .shadow(color: Color(.systemGray3).opacity(0.08), radius: 4, x: 0, y: 2)
        }
        .frame(height: UIScreen.main.bounds.width * 0.40)
    }
}

#Preview {
    DoctorCard(doctor:  Doctor(doctorId: "", name: "Jennifer Miller", specialty: "Pediatrician", hospital: "Mercy Hospital", rating: 4.8, imageName: "doctor_female_1", time: "10:30am - 5:30pm", isFavorite: false, stats: [], about: "", consultationDays: "Friday: 09:00 AM - 01:00 PM"))
}

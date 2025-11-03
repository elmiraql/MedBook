//
//  AppointmentCard.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import SwiftUI

struct AppointmentCard: View {
    
    let appointment: Appointment

    var body: some View {
        GeometryReader { geometry in
            
            let w = geometry.size.width
            let h = geometry.size.height
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    appointment.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: w * 0.15, height: w * 0.15)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(appointment.name)
                            .font(.title3).bold()
                            .foregroundColor(.white)
                        Text(appointment.specialty)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                        HStack {
                            Text("\(String(format: "%.1f", appointment.rating))")
                                .font(.body).bold()
                                .foregroundColor(.white)
                            
                            Image("Star")
                        }
                    }
                    Spacer()
                    Image("Kebab")
                }
               
                Spacer()
                HStack(spacing: 16) {
                    HStack(spacing: 8) {
                        Image("Calender")
                        Text(appointment.date)
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8) {
                        Image("Time")
                        Text(appointment.time)
                            .fontWeight(.bold)
                    }
                }
                .font(.body)
                .foregroundColor(.white)
            }
            .padding()
            .frame(width: w, height: h)
            .background(.primaryBlue)
            .cornerRadius(w * 0.05)
        }
    }
}

#Preview {
    AppointmentCard(
        appointment: Appointment(name: "Jason smith", avatar: "doctor_male_2", specialty: "Dentist", rating: 5.0, date: "22.02.2025", time: "16:00")
    )
}

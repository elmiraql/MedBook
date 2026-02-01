//
//  DoctorDetailsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.12.25.
//

import SwiftUI

struct DoctorDetailsView: View {
    
    let doctor: Doctor
    
    let doctorStats: [DoctorStat] = [
        .init(iconName: "profile-2user", valueText: "2,000+", caption: "patients"),
        .init(iconName: "medal", valueText: "10+", caption: "experience"),
        .init(iconName: "black_star", valueText: "5", caption: "rating"),
        .init(iconName: "messages", valueText: "1,872", caption: "reviews")
    ]
    
    var body: some View {
        
        VStack {
            HStack(spacing: 8) {
                Image("Doctor")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Dr. David Patel")
                        .bold()
                    Divider()
                    Text("Cardiologist")
                        .bold()
                        .foregroundColor(Color.gray)
                    HStack {
                        Image("location")
                        Text("Golden Cardiology Center")
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.1),
                    radius: 8,
                    x: 0,
                    y: 4)
            .padding()
            
            DoctorStatsRow(stats: doctorStats)
        }
    }
}

#Preview {
    DoctorDetailsView(doctor: Doctor(name: "", specialty: "", hospital: "", rating: 0, imageName: "", time: "", isFavorite: true, stats: []))
}

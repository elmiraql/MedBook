//
//  DoctorDetailsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.12.25.
//

import SwiftUI

struct DoctorDetailsView: View {
    
    let doctor: Doctor
    @StateObject private var viewModel: DoctorDetailViewModel
    
    init(doctor: Doctor) {
        _viewModel = StateObject(wrappedValue: DoctorDetailViewModel(doctor: doctor))
        self.doctor = doctor
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack(spacing: 8) {
                    Image(doctor.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(doctor.name)
                            .bold()
                        Divider()
                        Text(doctor.specialty)
                            .bold()
                            .foregroundColor(Color.gray)
                        HStack {
                            Image("location")
                            Text(doctor.hospital)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                .padding()
                
                DoctorStatsRow(stats: doctor.stats ?? [])
                
                Text("About me")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                               
                InlineExpandableText(text: doctor.about)
                    .padding(.top, 6)
                
                Text("Working time")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("\(doctor.consultationDays), \(doctor.time)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                    .padding(.top, 6)
                
                ReviewsSection(reviews: viewModel.reviews, isLoading: viewModel.isLoadingReviews, errorMessage: viewModel.errorMessage)
                    .padding(.horizontal)
                    .padding(.top)
                
            }
        }
        .navigationTitle("Doctor details")
    }
       
}

#Preview {
    DoctorDetailsView(doctor: Doctor(doctorId: "", name: "Jennifer Miller", specialty: "Pediatrician", hospital: "Mercy Hospital", rating: 4.8, imageName: "jennifer", time: "10:30am - 5:30pm", isFavorite: false, stats: [], about: "Dermatologist specializing in medical, surgical, and cosmetic dermatology. Dr. Rodriguez is fellowship-trained in Mohs micrographic surgery for skin cancer and laser treatments for acne scarring. With 12 years of experience, she has treated over 5,000 patients with complex skin conditions. Fluent in English and Spanish, she serves diverse communities.", consultationDays: "Friday: 09:00 AM - 01:00 PM"))
}

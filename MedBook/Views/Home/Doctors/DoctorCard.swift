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
            
            VStack {
                HStack(alignment: .top) {
                    Image("man")
                    //                    .resizable()
                    //                    .frame(width: 44, height: 44)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5){
                        Text("John Smith")
                            .font(.headline)
                        Text("Pediatrian | Mercy hospital")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        HStack {
                            Text("4.4")
                                .font(.body)
                            Image("Star")
                            Image(systemName: "calendar")
                                .padding(.leading)
                            Text("10:30am - 5:30pm")
                                .font(.body)
                            
                        }
                    }
                    Spacer()
                    Image(isFavorite ? "Favorite_fill" : "Favorite_empty")
                }
                RoundedActionButton(title: "Book Appointment", backgroundColor: Color(.lightBlue), textColor: Color(.primaryBlue), height: 60) {
                    
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
    DoctorCard(doctor:  Doctor(name: "Jennifer Miller", specialty: "Pediatrician", hospital: "Mercy Hospital", rating: 4.8, imageName: "jennifer", time: "10:30am - 5:30pm", isFavorite: false))
}

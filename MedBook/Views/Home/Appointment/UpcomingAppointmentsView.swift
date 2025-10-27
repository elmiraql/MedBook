//
//  UpcomingAppointmentsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import SwiftUI

struct UpcomingAppointmentsView: View {
    
    let appointments: [Appointment]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Upcoming Appointments")
                .font(.title).bold()
                .padding(.leading, 16)
                .padding(.top, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(appointments) { item in
                        AppointmentCard(appointment: item)
                            .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height*0.2)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}


#Preview {
    UpcomingAppointmentsView(appointments: [Appointment(name: "", avatar: "", specialty: "", rating: 0.0, date: "", time: ""), Appointment(name: "", avatar: "", specialty: "", rating: 0.0, date: "", time: ""), Appointment(name: "", avatar: "", specialty: "", rating: 0.0, date: "", time: "")])
}

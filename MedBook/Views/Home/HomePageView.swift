//
//  HomePageView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 26.10.25.
//

import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
     
        NavigationView {
            
            List{
                HomeHeaderView()
                UpcomingAppointmentsView(appointments: viewModel.appointments)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
            
        }

    }

    
}

#Preview {
    HomePageView()
    .environmentObject(HomeViewModel())
}

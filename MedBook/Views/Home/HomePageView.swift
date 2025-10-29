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
                    .listRowSeparator(.hidden)
                
                UpcomingAppointmentsView(appointments: viewModel.appointments)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                CategoriesGridView(categories: viewModel.categories)
                    .listRowSeparator(.hidden)
                    .padding(.top)
                
                FindDoctorsView(doctors: viewModel.doctors)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .selectionDisabled()
            
        }
    }
    
}

#Preview {
    HomePageView()
    .environmentObject(HomeViewModel())
}

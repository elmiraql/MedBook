//
//  HomePageView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 26.10.25.
//

import SwiftUI

struct HomePageView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @EnvironmentObject var navRouter: NavigationRouter
    
    var body: some View {
        
        NavigationView {
            
            List{
                HomeHeaderView()
                    .listRowSeparator(.hidden)
                
                UpcomingAppointmentsView(appointments: homeViewModel.appointments)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                CategoriesGridView(categories: homeViewModel.categories)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .padding(.top)
                
                HStack {
                    Text("Find Doctors")
                        .font(.title2).bold()
                    Spacer()
                    Button("See all") {
                        navRouter.navigate(to: .seeAllDoctors(homeViewModel))
                    }
                        .foregroundColor(Color.blue)
                }
                .padding(.bottom, 8)
                
                FindDoctorsView(doctors: homeViewModel.doctors)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .listStyle(.inset)
            .selectionDisabled()

        }
        
    }
    
}

#Preview {
    HomePageView()
    .environmentObject(HomeViewModel())
    .environmentObject(NavigationRouter())
}

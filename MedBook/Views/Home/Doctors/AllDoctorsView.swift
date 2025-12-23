//
//  AllDoctorsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 31.10.25.
//

import SwiftUI

struct AllDoctorsView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var searchText = ""
    @State private var selectedCategory: DoctorCategory?
    
    private var filteredDoctors: [Doctor] {
//        guard !searchText.isEmpty else { return viewModel.doctors }
       
        return viewModel.doctors.filter { doctor in
            
            let matchText = searchText.isEmpty ||
            doctor.name.localizedStandardContains(searchText) ||
            doctor.specialty.localizedStandardContains(searchText)
                        
            let matchCategory = selectedCategory == nil ||
            doctor.specialty == selectedCategory?.title
            
            return matchText && matchCategory
        }
    }
    
      var body: some View {
        VStack(spacing: 8) {
            
            //horizontal filter
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(viewModel.doctorCategories) { category in
                        
                        let isAll = category.apiKey == "all" || category.id == "all"
                        let isSelected = isAll ? (selectedCategory == nil) : (selectedCategory?.id == category.id)
                        
                        CategoryChip(
                            title: category.title,
                            isSelected: isSelected
                        ) {
                            if isAll {
                                selectedCategory = nil
                            } else {
                                selectedCategory = category
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            List {
                FindDoctorsView(doctors: filteredDoctors)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Find doctor")
        }
    }
}

#Preview {
    AllDoctorsView()
        .environmentObject(HomeViewModel())
}

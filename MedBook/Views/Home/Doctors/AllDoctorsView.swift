//
//  AllDoctorsView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 31.10.25.
//

import SwiftUI

struct AllDoctorsView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        FindDoctorsView(doctors: viewModel.doctors)
    }
}

#Preview {
    AllDoctorsView().environmentObject(HomeViewModel())
}

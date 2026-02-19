//
//  NavigationContainer.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 03.11.25.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {
    
    @inlinable
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    @EnvironmentObject var router: NavigationRouter    
    private let content: Content

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Route.self) { route in
                    routeView(for: route)
                }
        }
        .environmentObject(router)
    }

    @ViewBuilder
    func routeView(for route: Route) -> some View {
        switch route {
        case let .signIn(authViewModel):
            SignInView()
                .environmentObject(authViewModel)
                .environmentObject(router)
        case let .signUp(authViewModel):
            SignUpView()
                .environmentObject(authViewModel)
                .environmentObject(router)
        case let .setPassword(authViewModel):
            SetPasswordView()
                .environmentObject(authViewModel)
                .environmentObject(router)
        case let .otp(authViewModel):
            OTPView()
                .environmentObject(authViewModel)
                .environmentObject(router)
        case let .forgotPassword(authViewModel):
            SetPasswordView()
                .environmentObject(authViewModel)
        case let .seeAllDoctors(homeViewModel):
            AllDoctorsView(doctors: homeViewModel.doctors, categories: homeViewModel.doctorCategories)
        case let .doctorDetails(doctor):
            DoctorDetailsView(doctor: doctor)
        case let .bookAppointment(doctorId: doctorId):
            BookAppointment(doctorId: doctorId)
        default:
            EmptyView()
        }
    }
}


#Preview {
    NavigationContainer{ ContentView() }
        .environmentObject(NavigationRouter())
        .environmentObject(AuthViewModel())
}

//
//  NavigationContainer.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 03.11.25.
//

import SwiftUI

struct NavigationContainer: View {
    
    @EnvironmentObject var router: NavigationRouter
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        NavigationStack(path: $router.path) {
            ContentView()
                .navigationDestination(for: Route.self) { route in
                    routeView(for: route)
                }
        }
    }

    @ViewBuilder
    func routeView(for route: Route) -> some View {
        switch route {
        case .signIn:
            SignInView()
                .environmentObject(authVM)
                .environmentObject(router)
        case .signUp:
            SignUpView()
                .environmentObject(authVM)
                .environmentObject(router)
        case .setPassword:
            SetPasswordView()
                .environmentObject(authVM)
                .environmentObject(router)
        case .otp:
            OTPView()
                .environmentObject(authVM)
                .environmentObject(router)
        case .forgotPassword:
            SetPasswordView()
                .environmentObject(authVM)
        case .seeAllDoctors:
            let viewModel = HomeViewModel()
            AllDoctorsView()
                .environmentObject(viewModel)
        default:
            SignInView()
                .environmentObject(authVM)
        }
    }
}


#Preview {
    NavigationContainer()
        .environmentObject(NavigationRouter())
        .environmentObject(AuthViewModel())
}

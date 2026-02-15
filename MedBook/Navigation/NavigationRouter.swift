//
//  NavigationViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 21.10.25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case setPassword(AuthViewModel)
    case signIn(AuthViewModel)
    case signUp(AuthViewModel)
    case otp(AuthViewModel)
    case forgotPassword(AuthViewModel)
    case seeAllDoctors(HomeViewModel)
    case doctorDetails(doctor: Doctor)
}

@MainActor
class NavigationRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    @inlinable
    @inline(__always)
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func reset() {
        path = NavigationPath()
    }
    
    @inlinable
    @inline(__always)
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    @inlinable
    @inline(__always)
    func popToRoot() {
        path.removeLast(path.count)
    }
}

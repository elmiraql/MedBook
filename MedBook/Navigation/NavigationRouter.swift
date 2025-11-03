//
//  NavigationViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 21.10.25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case setPassword
    case signIn
    case signUp
    case otp
    case forgotPassword
    case seeAllDoctors
}

class NavigationRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func reset() {
        path = NavigationPath()
    }
}

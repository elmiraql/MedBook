//
//  AuthViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject, Hashable {    

   @Published var icons: [SocialIcon] = [
        SocialIcon(imageName: "Google") { print("Google tapped") },
        SocialIcon(imageName: "apple") { print("Apple tapped") },
        SocialIcon(imageName: "Facebook") { print("Facebook tapped") } ]

    @Published var fullName: String = ""
    @Published var emailAddress: String = ""
    
    let id = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: AuthViewModel, rhs: AuthViewModel) -> Bool {
        lhs.id == rhs.id
    }
} 

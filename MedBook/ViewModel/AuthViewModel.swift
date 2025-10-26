//
//  AuthViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {

   @Published var icons: [SocialIcon] = [
        SocialIcon(imageName: "Google") { print("Google tapped") },
        SocialIcon(imageName: "apple") { print("Apple tapped") },
        SocialIcon(imageName: "Facebook") { print("Facebook tapped") } ]

    @Published var fullName: String = ""
    @Published var emailAddress: String = ""
    

}

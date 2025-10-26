//
//  SocialIcon.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 16.10.25.
//

import Foundation

struct SocialIcon: Identifiable {
    let id = UUID()
    let imageName: String
    let action: () -> Void
}

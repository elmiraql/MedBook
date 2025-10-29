//
//  Appointment.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import Foundation
import SwiftUI

struct Appointment: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let avatar: String
    let specialty: String
    let rating: Double
    let date: String
    let time: String
    
    var image: Image {
           Image(avatar)
       }
}

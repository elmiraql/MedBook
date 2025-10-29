//
//  Category.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import Foundation

struct Category: Identifiable, Codable {
    let id = UUID()
    let name: String
    let icon: String 
}

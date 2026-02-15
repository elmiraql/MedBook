//
//  NetworkError.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.02.26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    
    case noDataFound
    
    var errorDescription: String? {
        switch self {
        case .noDataFound: "No data found"
        }
    }
}

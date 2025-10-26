//
//  NavigationViewModel.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 21.10.25.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var path = NavigationPath()
}

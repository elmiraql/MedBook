//
//  MedBookApp.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import SwiftUI

@main
struct MedBookApp: App {
    
    @StateObject var navRouter = NavigationRouter()
    @StateObject var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(navRouter)
            NavigationContainer{
                ContentView()
            }
            .environmentObject(navRouter)
            .environmentObject(authVM)
        }
    }
}

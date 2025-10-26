//
//  ContentView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            NavigationStack {
               EntryView()
            }
        }
       
    }
}

#Preview {
    ContentView()
}

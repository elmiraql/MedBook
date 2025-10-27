//
//  ContentView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab: Hashable {
        case home
//        case bookings
//        case chat
//        case profile
    }
    
    @State var selectedTab: Tab = .home
//    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        Group {
//            NavigationStack {
                
//               EntryView()
                
                TabView(selection: $selectedTab) {
                    HomePageView()
                        .environmentObject(homeViewModel)
                        .tabItem{
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .tag(Tab.home)
                    
                    
                }
                
//            }
        }
       
    }
}

#Preview {
    ContentView()
}

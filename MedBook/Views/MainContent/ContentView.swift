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
        case profile
    }
    
    @State var selectedTab: Tab = .home
    
    @EnvironmentObject var navRouter: NavigationRouter
    @EnvironmentObject var authViewModel: AuthViewModel
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.green
    }
  
    var body: some View {
        Group {
//            NavigationStack {
                
//               EntryView()
                
                TabView(selection: $selectedTab) {
                    HomePageView()
                        .tabItem{
                            Image("Home")
                            Text("Home")
                        }
                        .tag(Tab.home)
                        .toolbarBackground(Color.primaryBlue, for: .tabBar)
                        .toolbarBackgroundVisibility(.visible, for: .tabBar)
                        .environmentObject(navRouter)

                    ProfileView()
                        .tabItem{
                            Image("Profile")
                            Text("Profile")
                        }
                        .tag(Tab.profile)
                        .toolbarBackground(Color.primaryBlue, for: .tabBar)
                        .toolbarBackgroundVisibility(.visible, for: .tabBar)
                }
                .accentColor(.white)
            
//            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationRouter())
        .environmentObject(AuthViewModel())
}

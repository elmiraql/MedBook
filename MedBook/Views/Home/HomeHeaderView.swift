//
//  HomeHeaderView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 26.10.25.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Image("man")
            
            VStack{
                Text("Welcome back")
                    .font(.subheadline)
//                    .foregroundColor(.white.opacity(0.7))
                Text("Andrew Smith")
            }
            
            Spacer()
            
            Image("Search")
            Image("Favorite")
        }
//        .padding(.horizontal)
    }
}

#Preview {
    HomeHeaderView()
}

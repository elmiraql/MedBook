//
//  SignUpView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var fullName: String = ""
    @State private var emailAddress: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var navModel: NavigationRouter
    
    var body: some View {

        GeometryReader { geometry in
            VStack {
                CustomTextField(title: "Full Name", placeholder: "Enter full name", text: $fullName, height: geometry.size.width*0.15)
                
                CustomTextField(title: "Email address", placeholder: "Enter email address", text: $emailAddress, height: geometry.size.width*0.15)
                    .padding(.top)
                
                RoundedActionButton(title: "Continue", backgroundColor: Color("PrimaryBlue"), textColor: .white, height: geometry.size.width*0.15, action: {
                    viewModel.emailAddress = emailAddress
                    viewModel.fullName = fullName
                    navModel.path.append(Route.setPassword)
                })
                .padding()
                
                HStack{
                    Text("Already have an account?")
                    Button("Sign in", action: {
                        navModel.path.append(Route.signIn)
                    })
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.black)
                }
                
                SocialIconsBlock(icons: viewModel.icons, iconDiameter: geometry.size.width * 0.15)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
        .navigationTitle("Sign Up")
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthViewModel())
}


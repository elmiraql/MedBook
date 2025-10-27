//
//  SignInView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 16.10.25.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var emailAddress: String = ""

    var body: some View {
            GeometryReader { geometry in
                VStack {
                    CustomTextField(title: "Email address", placeholder: "Enter email address", text: $emailAddress, height: geometry.size.width*0.15)
                        .padding(.top)
                    
                    NavigationLink {
                        SetPasswordView().environmentObject(viewModel)
                    } label: {
                        RoundedActionButton(title: "Continue", backgroundColor: Color("PrimaryBlue"), textColor: .white, height: geometry.size.width*0.15, action: {})
                            .padding()
                    }
                    
                    HStack{
                        Text("Dont have an account?")
                        Button("Create account", action: { })
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                    
                    SocialIconsBlock(icons: viewModel.icons, iconDiameter: geometry.size.width * 0.15)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
            }
            .navigationTitle("Sign In")
        
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}

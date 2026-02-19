//
//  SetPasswordView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 17.10.25.
//

import SwiftUI

struct SetPasswordView: View {
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var navModel: NavigationRouter

    var body: some View {
//        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    CustomTextField(title: "New password", placeholder: "New password", text: $password, height: geometry.size.width*0.15)
                        
                    CustomTextField(title: "Confirm password", placeholder: "Confirm password", text: $confirmPassword, height: geometry.size.width*0.15)
                        .padding(.top)
                    
//                    NavigationLink {
//                        OTPView().environmentObject(viewModel)
//                    } label: {
                    RoundedActionButton(title: "Continue", backgroundColor: Color("PrimaryBlue"), textColor: .white, height: geometry.size.width*0.15, isEnabled: true, action: {
                            navModel.navigate(to: .otp(viewModel))
                        })
                            .padding()
//                    }
                    
                    SocialIconsBlock(icons: viewModel.icons, iconDiameter: geometry.size.width * 0.15)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .navigationTitle("Set password")
            }
//        }
    }
}

#Preview {
    SetPasswordView()
        .environmentObject(AuthViewModel())
}

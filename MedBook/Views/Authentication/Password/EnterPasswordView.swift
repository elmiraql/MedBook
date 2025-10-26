//
//  EnterPassword.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 20.10.25.
//

import SwiftUI

struct EnterPasswordView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    CustomTextField(title: "Enter password", placeholder: "Enter password", text: $password, height: geometry.size.width*0.15)
                        .padding(.top)
                                        
                    NavigationLink{
                        SetPasswordView()
                            .environmentObject(viewModel)
                    }label: {
                        Button("Forgot password?", action: { })
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                        .padding(.top, 4)
                    }
                    
                    NavigationLink {

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
}

#Preview {
    EnterPasswordView().environmentObject(AuthViewModel())
}

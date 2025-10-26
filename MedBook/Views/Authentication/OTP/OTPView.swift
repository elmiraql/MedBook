//
//  OTPView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 17.10.25.
//

import SwiftUI

struct OTPView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var otpCode = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text("We've sent an OTP code to your email, \nuser@gmail.com")
                    .font(.system(size: 16))
                    .foregroundColor(Color(.sRGB, red: 0.28, green: 0.28, blue: 0.28, opacity: 1))
                    .multilineTextAlignment(.center)
                    .padding()
                
                OTPFieldView(numberOfFields: 4, otp: $otpCode, width: geometry.size.width*0.2, height: geometry.size.width*0.15)
                    .padding(.top)
                
                Text("We will resend code in 59 s")
                    .padding(.top)
                
                RoundedActionButton(title: "Verify", backgroundColor: Color("PrimaryBlue"), textColor: .white, height: geometry.size.width*0.15, action: {})
                    .padding()
                                
            }
            .navigationTitle("Enter OTP")
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)

        }
    }
}

#Preview {
    OTPView().environmentObject(AuthViewModel())
}

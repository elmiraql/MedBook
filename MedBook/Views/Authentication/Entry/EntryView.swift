//
//  EntryView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 15.10.25.
//

import SwiftUI

enum Route: Hashable {
    case setPassword
    case signIn
    case signUp
    case otp
    case forgotPassword
}

struct EntryView: View {
    
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    @StateObject var navModel = NavigationViewModel()
    
    var body: some View {
        NavigationStack(path: $navModel.path) {
            ZStack {
                //            Color(.cyan)
                //                .ignoresSafeArea()
                GeometryReader { geometry in
                    VStack{
                        Image("stethoscope")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.3)
                        Text("MedBook")
                            .font(.system(size: 32, weight: .bold))
                        Text("Ваша забота о здоровье начинается здесь. Легко выбирайте доктора, бронируйте визит и получайте напоминания!")
                            .font(.system(size: 16))
                            .foregroundColor(Color(.sRGB, red: 0.28, green: 0.28, blue: 0.28, opacity: 1))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .padding(.top, 1)
                        
                        VStack{
                            
                            RoundedActionButton(title: "Log In", backgroundColor: Color("PrimaryBlue"), textColor: .white, height: geometry.size.width*0.15, action: {
                                navModel.path.append(Route.signIn)
                            })
                            
                            RoundedActionButton(title: "Sign Up", backgroundColor: Color("LightGray"), textColor: .black, height: geometry.size.width*0.15, action: {
                                navModel.path.append(Route.signUp)
                            })
                            
                            Button {
                                navModel.path.append(Route.forgotPassword)
                            } label: {
                                Text("Forgot password?")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(Color.black)
                                    .padding(.top)
                            }
                            
                        }
                        .frame(width: geometry.size.width*0.5)
                        .padding(.top)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    
                    .navigationDestination(for: Route.self) { value in
                        switch value {
                        case .signIn:
                            SignInView()
                                .environmentObject(viewModel)
                                .environmentObject(navModel)
                        case .signUp:
                            SignUpView()
                                .environmentObject(viewModel)
                                .environmentObject(navModel)
                        case .setPassword:
                            SetPasswordView()
                                .environmentObject(viewModel)
                                .environmentObject(navModel)
                        case .otp:
                            OTPView()
                                .environmentObject(viewModel)
                                .environmentObject(navModel)
                        case .forgotPassword:
                            SetPasswordView()
                                .environmentObject(viewModel)
                        default:
                            SignInView()
                                .environmentObject(viewModel)
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    EntryView()
}

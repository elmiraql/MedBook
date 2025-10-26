//
//  OTPFieldView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 22.10.25.
//


import SwiftUI
import Combine

struct OTPFieldView: View {
    
    @FocusState private var pinFocusState: FocusPin?
    @Binding private var otp: String
    @State private var pins: [String]
    var width: CGFloat
    var height: CGFloat
    
    var numberOfFields: Int
    
    enum FocusPin: Hashable {
        case pin(Int)
    }
    
    init(numberOfFields: Int,
         otp: Binding<String>,
         width: CGFloat,
         height: CGFloat) {
        self.numberOfFields = numberOfFields
        self._otp = otp
        self._pins = State(initialValue: Array(repeating: "", count: numberOfFields))
        self.width = width
        self.height = height
    }
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(0..<numberOfFields, id: \.self) { index in
//                OTPTextField(text: $pins[index])
                OTPTextField(text: $pins[index], onDeleteBackward: {
                    if pins[index].isEmpty && index > 0 {
                           pinFocusState = FocusPin.pin(index - 1)
                       }
                })
//                    .modifier(OtpModifier(pin: $pins[index]))
                    .modifier(OtpModifier(width: width, height: height))
                    .foregroundColor(.black)
                    .onChange(of: pins[index], initial: true) { oldValue, newVal in
                        if newVal.count == 1 {
                            if index < numberOfFields - 1 {
                                pinFocusState = FocusPin.pin(index + 1)
                            } else {
                                // to clear focus after the last digit
                                // pinFocusState = nil
                            }
                        }
                        else if newVal.count == numberOfFields {
                            otp = newVal
                            updatePinsFromOTP()
                            pinFocusState = FocusPin.pin(numberOfFields - 1)
                        }
                        else if index > 0 && pins[index].isEmpty {
                                pinFocusState = FocusPin.pin(index - 1)
                            }
                        else if newVal.isEmpty {
                            if index > 0 {
                                pinFocusState = FocusPin.pin(index - 1)
                            }
                        }
                        updateOTPString()
                    }
                    .focused($pinFocusState, equals: FocusPin.pin(index))
                    .onTapGesture {
                        // set focus to the current field when tapped
                        pinFocusState = FocusPin.pin(index)
                    }
            }
        }
        .onAppear {
            updatePinsFromOTP()
        }
    }
    
    private func updatePinsFromOTP() {
        let otpArray = Array(otp.prefix(numberOfFields))
        for (index, char) in otpArray.enumerated() {
            pins[index] = String(char)
        }
    }
    
    private func updateOTPString() {
        otp = pins.joined()
    }

}

struct OtpModifier: ViewModifier {
    
//    @Binding var pin: String
    var width: CGFloat
    var height: CGFloat
//    var textLimit = 1
//    
//    func limitText(_ upper: Int) {
//        if pin.count > upper {
//            self.pin = String(pin.prefix(upper))
//        }
//    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
//            .onReceive(Just(pin)) { _ in limitText(textLimit) }
            .frame(width: width, height: height)
            .font(.system(size: 22))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    OTPFieldView(numberOfFields: 4, otp: .constant("4334"), width: 60, height: 40)
}

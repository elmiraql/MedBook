//
//  CircleIconView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 16.10.25.
//

import SwiftUI

struct CircleIconView: View {
    
    let imageName: String
    let diameter: CGFloat
    var backgroundColor: Color = Color(.systemGray6)

    var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: diameter, height: diameter)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: diameter * 0.4, height: diameter * 0.4)
        }
    }
}


//#Preview {
//    CircleIconView()
//}

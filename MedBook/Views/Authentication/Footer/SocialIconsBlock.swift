//
//  SocialIconsBlock.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 17.10.25.
//

import SwiftUI

struct SocialIconsBlock: View {
    
    let icons: [SocialIcon]
    let iconDiameter: CGFloat

    var body: some View {
        VStack {
            HStack {
                Divider()
                    .frame(width: 100, height: 1)
                    .background(Color(.systemGray5))
                Text("Or")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                Divider()
                    .frame(width: 100, height: 1)
                    .background(Color(.systemGray5))
            }
            .padding(.vertical, 8)

            HStack {
                ForEach(icons) { icon in
                    Button(action: icon.action) {
                        CircleIconView(
                            imageName: icon.imageName,
                            diameter: iconDiameter
                        )
                    }
                }
            }
        }
    }
}


#Preview {
    SocialIconsBlock(
        icons: [
            SocialIcon(imageName: "Google") { print("Google") },
            SocialIcon(imageName: "apple") { print("Apple") },
            SocialIcon(imageName: "Facebook") { print("Facebook") }
        ],
        iconDiameter: 60
    )
}

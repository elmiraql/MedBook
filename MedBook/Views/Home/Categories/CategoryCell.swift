//
//  CategoryCell.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import SwiftUI

struct CategoryCell: View {
    
    let category: Category
    let cellWidth: CGFloat

    var body: some View {
        VStack(spacing: 8) {
            Image(category.icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(.label))
            Text(category.name)
                .font(.headline)
                .foregroundColor(Color(.systemGray))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(width: cellWidth, height: cellWidth)
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(cellWidth/5)
    }
}


#Preview {
    CategoryCell(category: Category(name: "Name", icon: "apple"), cellWidth: 60)
}

//
//  CategoriesGridView.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 27.10.25.
//

import SwiftUI

struct CategoriesGridView: View {
    
    let categories: [Category]
    let spacing: CGFloat = 16
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 4)

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Categories")
                    .font(.title2).bold()
                Spacer()
                Button("See all") { }
                    .foregroundColor(Color.blue)
            }
            .padding(.bottom, 16)

            GeometryReader { geo in
                let gridWidth = geo.size.width - spacing * 3
                let cellSide = gridWidth / 4 - 8
                let rowHeight = cellSide - 8

                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(categories.prefix(8)) { category in
                        CategoryCell(category: category, cellWidth: rowHeight)
                            .frame(width: cellSide, height: cellSide)
                    }
                }
                .frame(height: rowHeight * 2 + spacing)
            }
            .frame(height: (UIScreen.main.bounds.width - spacing * 3) / 2)
        }
//        .background(Color(.red))
    }
}


#Preview {
    CategoriesGridView(categories: [
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        Category(name: "Name", icon: "Cadiologist"),
        

    ])
}

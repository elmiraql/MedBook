//
//  ReviewsSection.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 09.02.26.
//

import SwiftUI

struct ReviewsSection: View {
    
    let reviews: [Review]
    let isLoading: Bool
    let errorMessage: String?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("Reviews")
                    .font(.title3.bold())
                Spacer()
                Text("See All")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            if isLoading {
                
                ProgressView()
                    .frame(maxWidth: .infinity)
                
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            } else if reviews.isEmpty {
                Text("No reviews yet")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            } else {
                
                LazyVStack(spacing: 12) {
                    ForEach(reviews.prefix(3)) { review in
                        ReviewRow(review: review)
                    }
                }
                
            }
        }
        .padding(.vertical, 8)
    }
}

struct ReviewRow: View {
    
    let review: Review
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 12) {
                
                Image(systemName: "person.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text(review.author)
                            .font(.subheadline.bold())
                        Spacer()
                        Text(review.stars)
                            .font(.caption)
                    }
                    
                    Text(review.text)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    Text(review.date)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                    
                    
                }
            }
            Divider()
        }
    }
}


#Preview {
    ReviewsSection(reviews: [Review(text: "Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel to anyone seeking exceptional cardiac care.", author: "Emily Anderson", stars: "", date: "today")], isLoading: false, errorMessage: "")
}

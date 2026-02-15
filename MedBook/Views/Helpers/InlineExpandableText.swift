//
//  InlineExpandableText.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 05.02.26.
//

import SwiftUI

struct InlineExpandableText: View {
    
    let text: String
    let maxLines: Int = 3
    let truncateAt: Int = 120   

    @State private var isExpanded = false

    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
                
                Text(displayedText)
                    .lineLimit(isExpanded ? nil : maxLines)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.secondary)
                
                if needsToggle {
                    
                    Button(isExpanded ? "hide" : "show more") {
                        isExpanded.toggle()
                    }
                    .font(.caption.bold())
                    .foregroundStyle(.black)
                    .background(.background)
                    .buttonStyle(.plain)
                    .underline()
                }
                
            }
            .padding(.horizontal)
        }
//        Spacer(minLength: 0)
    }

    private var needsToggle: Bool {
        text.count > truncateAt
    }

    private var displayedText: String {
        if isExpanded || !needsToggle {
            return text
        } else {
            return String(text.prefix(truncateAt)) + "…"
        }
    }
}




#Preview {
    InlineExpandableText(text: "Isaac Asimov was the most prolific science fiction author of all time. In fifty years he averaged a new magazine article, short story, or book every two weeks, and most of that on a manual typewriter. Asimov thought that The Last Question, first copyrighted in 1956, was his best short story ever. Even if you do not have the background in science to be familiar with all of the concepts presented here, the ending packs more impact than any other book that I've ever read. Don't read the end of the story first!")
}

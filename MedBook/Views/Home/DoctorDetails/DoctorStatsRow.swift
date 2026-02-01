//
//  DoctorStatsRow.swift
//  MedBook
//
//  Created by Elmira Qurbanova on 28.12.25.
//

import SwiftUI

struct DoctorStatsRow: View {
    
    let stats: [DoctorStat]

    var body: some View {
        
        HStack(spacing: 24) {
            ForEach(stats) { stat in
                StatItemView(stat: stat)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

private struct StatItemView: View {
    
    let stat: DoctorStat

    var body: some View {
        
        VStack(spacing: 8) {
            
            ZStack {
                
                Circle()
                    .fill(Color(.systemGray6))
                    .frame(width: 56, height: 56)

                Image(stat.iconName)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(Color(.label))
            }

            Text(stat.valueText)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color(.label))

            Text(stat.caption)
                .font(.system(size: 13))
                .foregroundStyle(Color(.secondaryLabel))
        }
        .frame(maxWidth: .infinity)
        
    }
}

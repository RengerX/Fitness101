//
//  ActivityCard.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 30.01.2026.
//

import SwiftUI



struct ActivityCard: View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text(activity.subtitle)
                            .font(.caption)
                        
                    }
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tinColor)
                        
                }
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
                
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCard(activity: Activity( title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .green, amount: "9812"))
}

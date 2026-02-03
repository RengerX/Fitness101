//
//  WorkoutCard.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 31.01.2026.
//

import SwiftUI

struct WorkoutCard: View {
    @State var workout: Workout
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text(workout.duration)
                        
                }
                HStack {
                    Text(workout.date)
                    
                    Spacer()
                    
                    Text(workout.calories)
                        
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct WorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run", tintColor: .cyan, duration: "23 mins", date: "AUG 3", calories: "341 kcal"))
    }
}

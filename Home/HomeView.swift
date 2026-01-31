//
//  HomeView.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 29.01.2026.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockActivites = [
        Activity(id: 0, title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .green, amount: "9812"),
        Activity(id: 1, title: "Today ", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .red, amount: "9812"),
        Activity(id: 2, title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .blue, amount: "9812"),
        Activity(id: 3, title: "Today steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .purple, amount: "104,812"),
        
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .cyan, duration: "23 mins", date: "AUG 3", calories: "341 kcal"),
        Workout(id: 1, title: "Strengh Training", image: "figure.run", tintColor: .red, duration: "23 mins", date: "AUG 1", calories: "341 kcal"),
        Workout(id: 2, title: "Running", image: "figure.run", tintColor: .blue, duration: "5 min", date: "AUG 11", calories: "341 kcal"),
        Workout(id: 3, title: "Running", image: "figure.run", tintColor: .purple, duration: "1 min", date: "AUG 19", calories: "341 kcal"),
    ]
    var body: some View {
        NavigationStack {
            
            ScrollView (showsIndicators: false) {
                
                VStack (alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack {
                            VStack(alignment: .leading, spacing:  8)  {
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                
                                Text("123 kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing:  8)  {
                                Text("Activite ")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                
                                Text("52 mins")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing:  8)  {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("8 hours")
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            ProgressCircleView(progress: $calories, goal: 600, color: .red)
                            
                            ProgressCircleView(progress: $active, goal: 60, color: .green)
                                .padding(.all, 20)
                            ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                                .padding(.all, 40)
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text("Fitness Activity")
                            .font(.title2)
                        Spacer()
                        
                        Button {
                            print("show more")
                        } label: {
                            Text("Show More")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(20)
                            
                        }
                        
                    }
                    
                
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(mockActivites, id: \.id) { activity in
                        ActivityCard(activity: activity)
                        
                    }
                    
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Recent workouts")
                        .font(.title2)
                    Spacer()
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("Show More")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top)
                LazyVStack {
                    ForEach(mockWorkouts, id: \.id) { workout in
                        WorkoutCard(workout: workout)
                }
                    
                }
                .padding(.bottom)
               
                
            }
        
        }
    }
}

#Preview {
    HomeView()
}

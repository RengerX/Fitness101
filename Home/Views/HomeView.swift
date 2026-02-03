//
//  HomeView.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 29.01.2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
   
    
    
   
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
                                
                                Text("\(viewModel.calories)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing:  8)  {
                                Text("\(viewModel.exercise)")
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
                            ProgressCircleView(progress: $viewModel.calories, goal: 600, color: .red)
                            
                            ProgressCircleView(progress: $viewModel.exercise, goal: 60, color: .green)
                                .padding(.all, 20)
                            ProgressCircleView(progress: $viewModel.stand, goal: 12, color: .blue)
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
                    ForEach(viewModel.mockActivites, id: \.id) { activity in
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
                    ForEach(viewModel.mockWorkouts, id: \.id) { workout in
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

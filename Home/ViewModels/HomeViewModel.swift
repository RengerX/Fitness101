//
//  HomeViewModel.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 31.01.2026.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var exercise : Int = 0
    @Published var stand: Int = 0
    
    @Published var mockActivites = [
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
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
              fetchTodayCalories()
                fetchTodayExerciseTime()
                fetchTodayStandHours()
               
            } catch {
                print(error.localizedDescription)
            }
        }
           
        }
    
    func  fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
        
    }
    
    func  fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { result in
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    func  fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = Int(hours)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
        
    }
    }


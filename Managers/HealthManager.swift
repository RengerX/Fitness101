//
//  HealthManager.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 01.02.2026.
//

import Foundation
import HealthKit
extension Date {
    
    static var startofDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
        
    }
    
    static var startofWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        
        return calendar.date(from: components) ?? Date()
        
    }
}
extension Double {
    
    func formattedNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}


class HealthManager {
    static let shared = HealthManager()
    
    let healthStore = HKHealthStore()
    
    private init () {
        
        
        Task {
            do {
                try await requestHealthKitAccess()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func requestHealthKitAccess() async throws {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        let steps = HKQuantityType(.stepCount)
        let workouts = HKSampleType.workoutType()
        
        let healthTypes: Set = [calories, exercise, stand, steps, workouts]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
        
    }
    
    func fetchTodayCaloriesBurned(completion:@escaping (Result<Double, Error>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let  predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
        }
        
        healthStore.execute(query)
    }
    func fetchTodayExerciseTime(completion:@escaping (Result<Double, Error>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let  predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let ExerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(ExerciseTime))
        }
        
        healthStore.execute(query)
    }
    func fetchTodayStandHours(completion:@escaping (Result<Int, Error>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let  predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) {_, results, error in
            guard let samples = results as? [HKCategorySample], error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let standCount = samples.filter({ $0.value == 0 }).count
            completion(.success(standCount))
            
        }
        
        healthStore.execute(query)
    }
    
    //Mark: Fitness Activity
    
    func fetchTodaySteps (completion:@escaping (Result<Activity, Error>) -> Void) {
        let steps = HKQuantityType(.stepCount)
        let  predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let steps = quantity.doubleValue(for: .count())
            let activity = Activity( title: "Today Steps", subtitle: "Goal: 800", image: "figure.walk", tinColor: .green, amount: steps.formattedNumberString())
            completion(.success(activity))
        }
        
        healthStore.execute(query)
    }
    
    func fetchCurrentWeekWorkoutStats(completion:@escaping (Result<[Activity], Error>) -> Void) {
        let workouts = HKSampleType.workoutType()
        let  predicate = HKQuery.predicateForSamples(withStart: .startofWeek, end: Date())
        let query = HKSampleQuery(sampleType: workouts, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [weak self] _, results, error in
            guard let workouts = results as? [HKWorkout], let self = self, error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            var runningCount: Int = 0
            var strengtCount: Int = 0
            var soccerCount: Int = 0
            var basketballCount: Int = 0
            var stairsCount: Int = 0
            var kickboxingCount: Int = 0
            
            for workout in workouts {
                let duration = Int(workout.duration)/60
                if workout.workoutActivityType == .running {
                    runningCount += duration
                }else  if workout.workoutActivityType == .traditionalStrengthTraining {
                    strengtCount += duration
                }else  if workout.workoutActivityType == .soccer {
                    soccerCount += duration
                } else  if workout.workoutActivityType == .basketball {
                    basketballCount += duration
                }else  if workout.workoutActivityType == .stairClimbing{
                    stairsCount += duration
                }else  if workout.workoutActivityType == .kickboxing{
                    kickboxingCount += duration
                }
            }
            
            completion(.success(self.generateActivitiesFromDuration(running: runningCount, strengt: strengtCount, soccer: soccerCount, basketball: basketballCount, stair: stairsCount, kickboxing: kickboxingCount)))
        }
        
        healthStore.execute(query)
    }
    func generateActivitiesFromDuration(running: Int, strengt: Int, soccer:Int, basketball:Int, stair:Int, kickboxing:Int) -> [Activity] {
        return [
           Activity( title: "Runnig", subtitle: "This week", image: "figure.run", tinColor: .green, amount: "\(running)"),
           Activity( title: "Strength Training", subtitle: "This week", image: "dumbell", tinColor: .blue, amount: "\(strengt)"),
           Activity( title: "Soccer", subtitle: "This week", image: "figure.soccer", tinColor: .indigo, amount: "\(soccer)"),
           Activity( title: "Basketball", subtitle: "This week", image: "figure.basketball", tinColor: .green, amount: "\(basketball)"),
           Activity( title: "stair", subtitle: "This week", image: "figure.stair.stepper", tinColor: .green, amount: "\(stair)"),
           Activity( title: "kickboxing", subtitle: "This week", image: "figure.kickboxing", tinColor: .green, amount: "\(kickboxing)"),
        ]
    }
}



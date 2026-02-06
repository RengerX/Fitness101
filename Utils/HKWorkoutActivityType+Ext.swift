//
//  HKWorkoutActivityType+Ext.swift
//  FitAppn
//
//  Created by Konstantin Nesterov on 05.02.2026.
//

import HealthKit
import SwiftUI
extension HKWorkoutActivityType {

    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }
    var image: String {
        let symbolName: String
        switch self {
        case .running:                       symbolName = "figure.run"
        case .cycling:                       symbolName = "bicycle"
        case .walking:                       symbolName = "figure.walk"
        case .swimming:                      symbolName = "figure.pool.swim"
        case .hiking:                        symbolName = "figure.hiking"
        case .yoga:                          symbolName = "figure.yoga"
        case .traditionalStrengthTraining:   symbolName = "dumbbell"
        case .functionalStrengthTraining:    symbolName = "figure.strengthtraining.traditional"
        case .crossTraining:                 symbolName = "figure.cross.training"
        case .highIntensityIntervalTraining:  symbolName = "figure.highintensity.intervaltraining"
        case .rowing:                        symbolName = "figure.rower"
        case .elliptical:                    symbolName = "figure.elliptical"
        case .coreTraining:                  symbolName = "figure.core.training"
        case .dance:                         symbolName = "figure.dance"
        case .danceInspiredTraining:         symbolName = "figure.dance"
        case .martialArts:                   symbolName = "figure.martial.arts"
        case .mindAndBody:                   symbolName = "brain"
        case .pilates:                       symbolName = "figure.pilates"
        case .barre:                         symbolName = "figure.barre"
        case .flexibility:                   symbolName = "figure.flexibility"
        case .stepTraining:                  symbolName = "figure.step.training"
        case .kickboxing:                    symbolName = "figure.boxing"
        case .stairs:                        symbolName = "stairs"
        case .jumpRope:                      symbolName = "figure.jumprope"
        case .golf:                          symbolName = "figure.golf"
        case .tennis:                        symbolName = "figure.tennis"
        case .badminton:                     symbolName = "figure.badminton"
        case .soccer:                        symbolName = "soccerball"
        case .basketball:                    symbolName = "basketball"
        case .baseball:                      symbolName = "baseball"
        case .volleyball:                    symbolName = "figure.volleyball"
        case .americanFootball:              symbolName = "football"
        case .rugby:                         symbolName = "sportscourt"
        case .boxing:                        symbolName = "figure.boxing"
        case .climbing:                      symbolName = "figure.climbing"
        case .crossCountrySkiing:            symbolName = "figure.skiing.crosscountry"
        case .downhillSkiing:                symbolName = "figure.skiing.downhill"
        case .snowboarding:                  symbolName = "snowboard"
        case .skatingSports:                 symbolName = "figure.skating"
        case .snowSports:                    symbolName = "snowflake"
        case .paddleSports:                  symbolName = "figure.rowing"
        case .surfingSports:                 symbolName = "figure.surfing"
        case .waterSports:                   symbolName = "drop"
        case .waterFitness:                  symbolName = "figure.water.fitness"
        case .sailing:                       symbolName = "sailboat"
        case .fishing:                       symbolName = "fish"
        case .archery:                       symbolName = "bow.arrow"
        case .bowling:                       symbolName = "bowlingball"
        case .fencing:                       symbolName = "figure.fencing"
        case .gymnastics:                    symbolName = "figure.gymnastics"
        case .trackAndField:                 symbolName = "figure.track.and.field"
        case .curling:                       symbolName = "figure.curling"
        case .handball:                      symbolName = "hand.raised"
        case .lacrosse:                      symbolName = "sportscourt"
            
            
        case .racquetball:                   symbolName = "figure.racquetball"
        case .squash:                        symbolName = "figure.squash"
        case .tableTennis:                   symbolName = "tabletennis.racket"
        case .wrestling:                     symbolName = "figure.wrestling"
        case .equestrianSports:              symbolName = "horse"
        case .hockey:                        symbolName = "hockey.puck"
        case .hunting:                       symbolName = "binoculars"
        case .play:                          symbolName = "gamecontroller"
        case .preparationAndRecovery:        symbolName = "bolt.heart"
        case .mixedCardio:                   symbolName = "figure.mixed.cardio"
        case .handCycling:                   symbolName = "figure.hand.cycling"
        case .wheelchairWalkPace:            symbolName = "figure.roll"
        case .wheelchairRunPace:             symbolName = "figure.roll.runningpace"
        case .taiChi:                        symbolName = "figure.taichi"
        case .mixedMetabolicCardioTraining:  symbolName = "figure.mixed.cardio"
        case .discSports:                    symbolName = "disc"
        case .fitnessGaming:                 symbolName = "gamecontroller"
        case .softball:                      symbolName = "softball"
        case .cricket:                       symbolName = "cricket.ball"
        case .waterPolo:                     symbolName = "water.waves"
        case .australianFootball:            symbolName = "sportscourt"
        case .cooldown:                      symbolName = "bolt.heart"
        case .socialDance:                   symbolName = "figure.dance"
        case .cardioDance:                   symbolName = "figure.dance"
        case .pickleball:                    symbolName = "figure.pickleball"
            
            
            // Fallback to generic icons for less common sports
        default:  symbolName = "questionmark"
        }
                // Generic workout icon for everything else
                return  symbolName
            }
    var color: Color {
            switch self {
            // Cardio/Aerobic Activities
            case .running:                      return Color.blue
            case .cycling:                      return Color.cyan
            case .walking:                      return Color.green
            case .hiking:                       return Color.brown
            case .swimming:                     return Color.teal
            case .elliptical:                   return Color.indigo
            case .rowing:                       return Color.mint
            case .highIntensityIntervalTraining: return Color.red
            case .mixedCardio:                  return Color.purple
            case .mixedMetabolicCardioTraining: return Color.pink
            case .stepTraining:                 return Color.orange
            case .stairs:                       return Color.brown.opacity(0.7)
            case .jumpRope:                     return Color.yellow
            case .handCycling:                  return Color.cyan.opacity(0.8)
            case .wheelchairWalkPace:           return Color.gray
            case .wheelchairRunPace:            return Color.gray.opacity(0.8)
                
            // Strength Training
            case .traditionalStrengthTraining:  return Color.red
            case .functionalStrengthTraining:   return Color.red.opacity(0.8)
            case .coreTraining:                 return Color.red.opacity(0.6)
                
            // Mind & Body
            case .yoga:                         return Color.purple
            case .pilates:                      return Color.purple.opacity(0.8)
            case .barre:                        return Color.purple.opacity(0.6)
            case .flexibility:                  return Color.pink
            case .mindAndBody:                  return Color.indigo
            case .taiChi:                       return Color.blue.opacity(0.7)
                
            // Dance
            case .dance:                        return Color.pink
            case .danceInspiredTraining:        return Color.pink.opacity(0.8)
                
            // Sports - Team
            case .soccer:                       return Color.green.opacity(0.8)
            case .basketball:                   return Color.orange
            case .baseball:                     return Color.blue.opacity(0.6)
            case .volleyball:                   return Color.yellow.opacity(0.7)
            case .americanFootball:             return Color.brown
            case .rugby:                        return Color.green.opacity(0.6)
            case .hockey:                       return Color.red.opacity(0.5)
            case .cricket:                      return Color.green.opacity(0.5)
            case .softball:                     return Color.blue.opacity(0.4)
            case .handball:                     return Color.orange.opacity(0.6)
            case .lacrosse:                     return Color.yellow.opacity(0.6)
            case .australianFootball:           return Color.brown.opacity(0.6)
            case .waterPolo:                    return Color.cyan.opacity(0.6)
                
            // Sports - Racket
            case .tennis:                       return Color.yellow
            case .badminton:                    return Color.orange.opacity(0.7)
            case .tableTennis:                  return Color.red.opacity(0.6)
            case .racquetball:                  return Color.green.opacity(0.7)
            case .squash:                       return Color.orange.opacity(0.5)
            case .pickleball:                   return Color.yellow.opacity(0.6)
                
            // Sports - Martial Arts
            case .martialArts:                  return Color.red.opacity(0.7)
            case .boxing:                       return Color.red
            case .kickboxing:                   return Color.red.opacity(0.9)
            case .wrestling:                    return Color.brown
                
            // Sports - Winter
            case .crossCountrySkiing:           return Color.blue.opacity(0.6)
            case .downhillSkiing:               return Color.blue
            case .snowboarding:                 return Color.cyan.opacity(0.7)


    case .skatingSports:                return Color.blue.opacity(0.8)
            case .snowSports:                   return Color.cyan
            case .curling:                      return Color.gray
                
            // Sports - Water
            case .surfingSports:                return Color.blue
            case .waterSports:                  return Color.teal
            case .sailing:                      return Color.blue.opacity(0.5)
            case .paddleSports:                 return Color.teal.opacity(0.7)
            case .waterFitness:                 return Color.mint
                
            // Sports - Other
            case .golf:                         return Color.green
            case .bowling:                      return Color.purple.opacity(0.6)
            case .climbing:                     return Color.brown
            case .gymnastics:                   return Color.pink.opacity(0.7)
            case .fencing:                      return Color.gray.opacity(0.6)
            case .archery:                      return Color.brown.opacity(0.8)
            case .equestrianSports:             return Color.brown.opacity(0.5)
            case .trackAndField:                return Color.orange
                
            // Outdoor/Nature
            case .fishing:                      return Color.blue.opacity(0.4)
            case .hunting:                      return Color.brown.opacity(0.4)
                
            // Gaming/Play
            case .play:                         return Color.yellow
            case .fitnessGaming:                return Color.yellow.opacity(0.8)
            case .discSports:                   return Color.orange.opacity(0.6)
                
            // Recovery
            case .preparationAndRecovery:       return Color.gray
            case .cooldown:                     return Color.gray.opacity(0.7)
                
            // Training Categories
            case .crossTraining:                return Color.purple
            case .cardioDance:                  return Color.pink
            case .socialDance:                  return Color.pink.opacity(0.6)
            
                
            // Default fallbacks by category
            default:
                // Try to categorize unknown types
                let rawValue = self.rawValue
                
                // iOS 16+ activities
                if rawValue >= 3000 && rawValue < 4000 {
                    return Color.blue.opacity(0.6)
                }
                // iOS 15+ activities
                else if rawValue >= 2000 && rawValue < 3000 {
                    return Color.green.opacity(0.6)
                }
                // iOS 14+ activities
                else if rawValue >= 1000 && rawValue < 2000 {
                    return Color.orange.opacity(0.6)
                }
                // Generic fallback
                else {
                    return Color.gray
                }
            }
        }
    }
        

//
//  PersistenceManager.swift
//  ccf
//
//  Created by Tyler Perkins on 7/30/22.
//

import Foundation

enum PersistenceActionType{
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    enum Keys { static let scheduled = "scheduled" }
    
    static func updateWith(schedule: Scheduled, actionType: PersistenceActionType, completed: @escaping (ccfError?) -> Void) {
        retrieveScheduled { result in
            switch result {
            case .success(var scheduled):
                switch actionType {
                case .add:
                    guard !scheduled.contains(schedule) else {
                        completed(.unableToSchedule)
                        
                        return
                    }
                    scheduled.append(schedule)
                    
                case .remove:
                    scheduled.removeAll { $0.id == schedule.id }
                    print("Scheduled event deleted: \(scheduled)")
                }
                completed(save(scheduled: scheduled))
            
            case .failure(let error):
                completed(error)
                
            }
        }
}
    
    static func retrieveScheduled(completed: @escaping (Result<[Scheduled], ccfError>) -> Void) {
        
        guard let scheduledData = defaults.object(forKey: Keys.scheduled) as? Data else {
            completed(.success([]))
            return
            
        }
        
        do {
            let decoder = JSONDecoder()
            let scheduled = try decoder.decode([Scheduled].self, from: scheduledData)
            completed(.success(scheduled))
            
        } catch {
            completed(.failure(.unableToSchedule))
            
        }
    }
    
    static func save(scheduled: [Scheduled]) -> ccfError? {
        do {
            let encoder = JSONEncoder()
            let encodedSchedule = try encoder.encode(scheduled)
            defaults.set(encodedSchedule, forKey: Keys.scheduled)
            
            return nil
        } catch {
            
            return .unableToSchedule
        }
    }
}





//
//  SessionManager.swift
//  MC3
//
//  Created by Francesco Merola on 20/02/23.
//

import Foundation

final class SessionManager: ObservableObject {
    
    enum UserDefaultsKeys {
        static let hasSeenOnboarding = "hasSeenOnboarding"
    }
    
    enum CurrentState {
        case onboarding
        case inApp
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func configureCurrentState () {
        let hasCompletetedOnboarding = UserDefaults.standard.bool (forKey: UserDefaultsKeys.hasSeenOnboarding)
        currentState = hasCompletetedOnboarding ? .inApp : .onboarding
    }
    
    func completeOnboarding() {
        currentState = .inApp
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasSeenOnboarding)
    }
}



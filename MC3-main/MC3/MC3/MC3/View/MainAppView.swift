//
//  MainAppView.swift
//  MC3
//
//  Created by Francesco Merola on 20/02/23.
//

import SwiftUI

struct MainAppView: View {
    
    @StateObject private var session = SessionManager()
    
    var body: some View {
        ZStack {
            switch session.currentState {
            case .onboarding:
                OnboardingView(action: session.completeOnboarding)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading)))
            case .inApp:
                ListView()
                    .environmentObject(session)
                    .transition(.opacity)
            default:
                // Splash Screen
                Color.blue.ignoresSafeArea()
            }
        }
        .animation(.easeInOut, value: session.currentState)
        .onAppear(perform: session.configureCurrentState)
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}


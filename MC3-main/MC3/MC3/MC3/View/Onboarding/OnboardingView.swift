//
//  WelcomeView.swift
//  MC3
//
//  Created by Francesco Merola on 20/02/23.
//

import SwiftUI

struct OnboardingView: View {
    
    let messageArray: [Message] = [
        Message(text: NSLocalizedString("BubbleMessage1", comment: ""), received: false),
        Message(text: NSLocalizedString("BubbleMessage2", comment: ""), received: true),
        Message(text: NSLocalizedString("BubbleMessage3", comment: ""), received: false),
        Message(text: NSLocalizedString("BubbleMessage4", comment: ""), received: true)
    ]
    
    @StateObject private var session = SessionManager()
    
    let action: () -> Void
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            TabView {
                
                WelcomeView()
                
                VStack {
                    ForEach(messageArray, id: \.self) { message in
                        MessageBubble(message: message)
                    }
                }
                .overlay (alignment: .bottom) {
                    Button (NSLocalizedString("OnboardingButtonText", comment: "")) {
                        action()
                    }
                    .foregroundColor(Color("WelcomeColor"))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .frame(width: 150, height: 50)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .offset(y: 100)
                    .transition(.scale.combined(with: .opacity))
                }
                
                
                
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView {}
    }
}


//
//  ClockView.swift
//  MC3
//
//  Created by Michele Gatto on 23/02/23.
//

import SwiftUI

struct ClockView: View {
    
    let habit: Habit
    
    @State private var goBack: Bool = false
    
    @State private var selectedPhrase = ""
    
    @AppStorage("selectedBadHabit") var selectedBadHabit: String = ""
    
    @AppStorage("goal") var goal = 0.0
    
    @AppStorage("current") var current = 0.0
    
    @AppStorage("over") var over: Bool = false
    
    @AppStorage("progressValue") var progressValue: Double = 0.0
    
    @State private var selected: Habit?
    
    let cigarettePhrases = [
        NSLocalizedString("CigarettePhrase1", comment: ""),
        NSLocalizedString("CigarettePhrase2", comment: ""),
        NSLocalizedString("CigarettePhrase3", comment: ""),
        NSLocalizedString("CigarettePhrase4", comment: ""),
        NSLocalizedString("CigarettePhrase5", comment: "")
    ]
    
    let alcoholPhrases = [
        NSLocalizedString("AlcoholPhrase1", comment: ""),
        NSLocalizedString("CigarettePhrase2", comment: ""),
        NSLocalizedString("CigarettePhrase3", comment: ""),
        NSLocalizedString("CigarettePhrase4", comment: "")
    ]
    
    let sweetsPhrases = [
        NSLocalizedString("SweetPhrase1", comment: ""),
        NSLocalizedString("SweetPhrase2", comment: ""),
        NSLocalizedString("SweetPhrase3", comment: ""),
        NSLocalizedString("SweetPhrase4", comment: "")
    ]
    
    let coffeePhrases = [
        NSLocalizedString("CoffeePhrase1", comment: ""),
        
        NSLocalizedString("CoffeePhrase2", comment: ""),
        NSLocalizedString("CoffeePhrase3", comment: ""),
        NSLocalizedString("CoffeePhrase4", comment: "")
    ]
    
    let gamblingPhrases = [
        NSLocalizedString("GamblingPhrase1", comment: ""),
        
        NSLocalizedString("GamblingPhrase2", comment: ""),
        
        NSLocalizedString("GamblingPhrase3", comment: ""),
        
        NSLocalizedString("GamblingPhrase4", comment: ""),
        
        NSLocalizedString("GamblingPhrase5", comment: ""),
        
        NSLocalizedString("GamblingPhrase6", comment: "")
    ]
    
    func navigationTitleColor() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(.white)]
    }
    
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack (spacing: 40) {
                    ZStack {
                        
                        ProgressBar (progress: self.$progressValue, color: over ? Color.red: Color("WelcomeColor"))
                            .frame (width: 330.0, height: 330.0)
                            .padding (20.0)
                            .overlay {
                                
                                if goal != 0.0 {
                                    Text("\(Int(current))/\(Int(goal))")
                                        .foregroundColor(.white)
                                        .font(.title)
                                } else {
                                    Text(NSLocalizedString("DefaultText", comment: ""))
                                }
                                
                                
                                ProgressBar (progress: self.$progressValue, color: over ? Color.red: Color.white)
                                    .frame (width: 260.0, height: 330.0)
                                    .padding (20.0)
                                    .overlay {
                                        
                                        ProgressBar (progress: self.$progressValue, color: over ? Color.red: Color("WelcomeColor"))
                                            .frame (width: 190.0, height: 330.0)
                                            .padding (20.0)
                                        
                                    }
                            }
                    }
                    if (goal > 0.0) {
                        HStack (spacing: 50) {
                            Button {
                                if progressValue > 0.0 {
                                    self.progressValue -= 1/goal
                                    if current > 0 {
                                        current -= 1
                                    }
                                    
                                }
                                
                                
                                if current <= goal {
                                    over = false
                                    selectedPhrase = ""
                                } else {
                                    over = true
                                }
                                
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundColor(Color("WelcomeColor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("WelcomeColor"), lineWidth: 2)
                                            .frame(width: 50, height: 30)
                                    )
                            }
                            
                            Button  {
                                if goal != 0.0 {
                                    
                                    
                                    
                                    self.progressValue += 1/goal
                                    print("\(progressValue)")
                                    current += 1
                                    
                                    if current > goal {
                                        over = true
                                        switch habit.name {
                                        case  "Cigarettes":
                                            selectedPhrase = cigarettePhrases.randomElement() ?? ""
                                        case "Coffee":
                                            selectedPhrase = coffeePhrases.randomElement() ?? ""
                                        case "Gambling":
                                            selectedPhrase = gamblingPhrases.randomElement() ?? ""
                                            
                                        case "Candies":
                                            selectedPhrase = sweetsPhrases.randomElement() ?? ""
                                            
                                            
                                        case "Alcohol":
                                            selectedPhrase = alcoholPhrases.randomElement() ?? ""
                                            
                                            
                                        default:
                                            selectedPhrase = ""
                                        }
                                    } else {
                                        over = false
                                        selectedPhrase = ""
                                        
                                    }
                                }
                                
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("WelcomeColor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("WelcomeColor"), lineWidth: 2)
                                            .frame(width: 50, height: 30)
                                    )
                            }
                            
                        }
                        
                        
                        Text(selectedPhrase)
                            .padding()
                        Spacer()
                    }
                    
                    
                    
                }
                .navigationTitle(habit.name)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            showModal = true
                            current = 0
                            progressValue = 0
                        } label: {
                            Text(NSLocalizedString("RightButtonText", comment: ""))
                        }
                        .sheet(isPresented: $showModal) {
                            GoalView (habit: habit)
                        }
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        NavigationLink(
                            destination: ListView().transition(.move(edge: .trailing)),
                            isActive: $goBack) {
                                Button(action: {
                                    
                                    goBack = true
                                    selectedBadHabit = ""
                                    current = 0.0
                                    progressValue = 0.0
                                    goal = 0.0
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.left")
                                        Text(NSLocalizedString("LeftButtonText", comment: ""))
                                    }
                                }
                            }
                        
                    }
                }
                
            }
        }
        //            .onAppear() {
        //                           // Set up a timer to update the current time every second
        //                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
        //                               goal.refreshValue()
        //                               current.refreshValue()
        //                           }
        //                       }
    }
}


struct ProgressBar: View {
    
    @Binding var progress: Double
    
    var color: Color = Color.green
    
    var body: some View {
        ZStack {
            Circle ()
                .stroke(lineWidth: 30.0)
                .opacity (0.20)
                .foregroundColor (Color.black)
            
            Circle()
                .trim(from: 0.0, to: CGFloat (min(self.progress, 1.0)))
                .stroke (style: StrokeStyle(lineWidth: 30.0, lineCap:
                        .round, lineJoin: .round) )
                .foregroundColor (color)
                .rotationEffect (Angle (degrees: 270))
                .animation (.easeInOut (duration: 2.0))
            
        }
        
    }
    
}


struct ClockView_Previews: PreviewProvider {
    
    static let habit = Habit(name: "Alcohol", questionGoal: "How many glasses of alcohol per day do you want to drink?")
    
    static var previews: some View {
        ClockView(habit: habit)
    }
}

//
//  HomeView.swift
//  MC3
//
//  Created by Francesco Merola on 20/02/23.
//

import SwiftUI

struct ListView: View {
    
    @AppStorage("selectedBadHabit") var selectedBadHabit: String = ""
    
    let habits: [Habit] = [
        Habit(name: NSLocalizedString("Alcohol", comment: ""), questionGoal: NSLocalizedString("AlcoholQuestion", comment: "")),
        Habit(name: NSLocalizedString("Candies", comment: ""), questionGoal: NSLocalizedString("CandiesQuestion", comment: "")),
        Habit(name: NSLocalizedString("Cigarettes", comment: ""), questionGoal: NSLocalizedString("CigaretteQuestion", comment: "")),
        Habit(name: NSLocalizedString("Coffee", comment: ""), questionGoal: NSLocalizedString("CoffeeQuestion", comment: "")),
        Habit(name: NSLocalizedString("Gambling", comment: ""), questionGoal: NSLocalizedString("GamblingQuestion", comment: ""))
    ]
    
    @StateObject private var session = SessionManager()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white)]
    }
    
    var body: some View {
        NavigationStack {
                if selectedBadHabit == "" {
                    
                    List (habits, id:\.self) { habit in
                        NavigationLink {
                            ClockView(habit: habit)
                                .onAppear {
                                    selectedBadHabit = habit.name
                                    print(selectedBadHabit)
                                }
                        } label: {
                            Text(habit.name)
                        }
                        .listRowSeparatorTint(Color.accentColor)
                        .navigationTitle(NSLocalizedString("NavigationTitleListView", comment: ""))
                    }
                    .navigationBarBackButtonHidden(true)
                } else {
                    switch selectedBadHabit {
                    case "Alcohol":
                        ClockView(habit: habits[0])
                    case "Candies":
                        ClockView(habit: habits[1])
                    case "Cigarettes":
                        ClockView(habit: habits[2])
                    case "Coffee":
                        ClockView(habit: habits[3])
                    default:
                        ClockView(habit: habits[4])
                        
                    }
                }
            
            
        }
    }
}
   

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(SessionManager())

    }
}


//
//  GoalView.swift
//  BreakTime
//
//  Created by Francesco Merola on 01/03/23.
//

import SwiftUI

struct GoalView: View {
    
    @AppStorage("goal") var goal = 0
    
    @Environment(\.dismiss) var dismiss
    
    let habit: Habit
    
    @State private var goToClock: Bool = false
    
    let pickerNumbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack (spacing: 30) {
                    Text(habit.questionGoal)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                    
                    Picker("Select a number", selection: $goal) {
                        ForEach(pickerNumbers, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 2)
                            .frame(width: 200, height: 200)
                    )
                    Spacer()
                }
            }
            .navigationTitle("Set your daily goal")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}


struct GoalView_Previews: PreviewProvider {
    
    static let habit: Habit = Habit(name: "Cigarette", questionGoal: "How many cigarettes per day do you want to smoke?")
    
    static var previews: some View {
        GoalView (habit: habit)
    }
}


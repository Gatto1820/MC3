//
//  Habit.swift
//  BreakTime
//
//  Created by Francesco Merola on 01/03/23.
//

import Foundation

struct Habit: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let questionGoal : String
}

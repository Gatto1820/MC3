//
//  ChatMessage.swift
//  MC3
//
//  Created by Francesco Merola on 21/02/23.
//

import Foundation
import SwiftUI

struct Message: Identifiable, Codable, Hashable {
    var id = UUID()
    let text: String
    let received: Bool
}

//
//  AverageOddsModel.swift
//  RB
//
//  Created by Алексей Баранов on 30.01.2024.
//

import Foundation
import SwiftUI

struct AverageOddsModel: Identifiable {
    let id: UUID = UUID()
    let type: ResultBet
    let colorProgressBar: Color
    var value: Double
}

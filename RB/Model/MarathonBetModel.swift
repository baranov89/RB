//
//  MarathonBetModel.swift
//  RB
//
//  Created by Алексей Баранов on 30.01.2024.
//

import Foundation
import SwiftUI

struct MarathonBetModel: Identifiable  {
    let id: UUID = UUID()
    let type: ResultBet
    let colorRectangle: Color
    var value: Int
}

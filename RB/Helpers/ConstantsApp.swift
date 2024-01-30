//
//  ConstantsApp.swift
//  RB
//
//  Created by Алексей Баранов on 30.01.2024.
//

import Foundation

enum ConstantsApp {
    enum AverageOdds {
        static var winnings: Double = 3
        static var losing: Double = 2.6
        static var refund: Double = 1.5
        static var progressBarLength: Double = 3.0
        
        static func changeValues() {
            winnings = Double.random(in: 1...3)
            losing = Double.random(in: 1...3)
            refund = Double.random(in: 1...3)
        }
    }
    enum MarathonBet {
        static var winnings: Int = 16
        static var losing: Int = 17
        static var refund: Int = 30
        
        static func changeValues() {
            winnings = Int.random(in: 20...30)
            losing = Int.random(in: 20...30)
            refund = Int.random(in: 20...30)
        }
    }
}

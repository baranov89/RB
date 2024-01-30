//
//  MainViewModel.swift
//  RB
//
//  Created by Алексей Баранов on 30.01.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var averageOddsData: [AverageOddsModel] = []
    @Published var marathonBetData: [MarathonBetModel] = []
    var totalMarathonBet: Int {
        ConstantsApp.MarathonBet.losing + ConstantsApp.MarathonBet.winnings + ConstantsApp.MarathonBet.refund
    }
    
    init() {
        getData()
    }
    
    private func getData() {
        averageOddsData = [
            AverageOddsModel(type: .winnings, colorProgressBar: .green, value: ConstantsApp.AverageOdds.winnings),
            AverageOddsModel(type: .losing, colorProgressBar: .red, value: ConstantsApp.AverageOdds.losing),
            AverageOddsModel(type: .refund, colorProgressBar: .gray, value: ConstantsApp.AverageOdds.refund)
        ]
        
        marathonBetData = [
            MarathonBetModel(type: .winnings, colorRectangle: .green, value: ConstantsApp.MarathonBet.winnings),
            MarathonBetModel(type: .losing, colorRectangle: .red, value: ConstantsApp.MarathonBet.losing),
            MarathonBetModel(type: .refund, colorRectangle: .gray, value: ConstantsApp.MarathonBet.refund)
        ]
    }
    
    func getProcent(value: Int) -> Int {
        (100 * value) / totalMarathonBet
    }
    
    func changeValues() {
        ConstantsApp.AverageOdds.changeValues()
        ConstantsApp.MarathonBet.changeValues()
        getData()
    }
    
    
}

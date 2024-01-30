//
//  ContentView.swift
//  RB
//
//  Created by Алексей Баранов on 29.01.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm = MainViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                averageOdds(widthScreen: geometry.size.width)
                marathonBetResults
                Spacer()
                Button(action: {
                    vm.changeValues()
                }, label: {
                    Text("change values")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding()
        }
    }
}

private extension MainView {
    var marathonBetResults: some View {
        VStack {
            Text("Выигрыши/проигрыши по букмейкерам")
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Image("pngegg-2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 50)
                    .padding(.trailing)
                Text("\(vm.totalMarathonBet) cтавки")
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { rectanglSize in
                HStack(spacing: 2) {
                    ForEach(vm.marathonBetData) { data in
                        VStack(alignment: data.type != .refund ? .leading : .trailing) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(maxWidth: (rectanglSize.size.width * CGFloat(data.value)) / CGFloat(vm.totalMarathonBet), maxHeight: 10)
                                .foregroundColor(data.colorRectangle)
                            Text("\(data.value) (\(vm.getProcent(value: data.value))%)")
                                .font(.system(size: 14))
                        }
                    }
                }
            }
            .frame(height: 40)
        }
        .customСell()
    }
    
    func averageOdds(widthScreen: CGFloat) -> some View {
        VStack {
            Text("Средние коэффициенты")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(vm.averageOddsData) { data in
                HStack(spacing: 0) {
                    GeometryReader { rectanglSize in
                        RoundedRectangle(cornerRadius: 5)
                            .frame(maxWidth: .infinity, maxHeight: 10)
                            .foregroundColor(.gray.opacity(0.4))
                            .overlay(alignment: .leading)  {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: (rectanglSize.size.width * data.value) / ConstantsApp.AverageOdds.progressBarLength, alignment: .leading)
                                        .foregroundColor(data.colorProgressBar)
                            }
                    }
                    .frame(height: 10)
                    Spacer()
                    Text(data.type.rawValue)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .frame(width: widthScreen * 0.25, alignment: .leading)
                    Text("\(data.value, specifier: "%.1f")")
                        .font(.system(size: 16))
                        .frame(width: widthScreen * 0.08, alignment: .trailing)
                }
            }
        }
        .customСell()
    }
}

#Preview {
    MainView()
}

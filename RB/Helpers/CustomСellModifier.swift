//
//  CustomСellModifier.swift
//  RB
//
//  Created by Алексей Баранов on 30.01.2024.
//

import Foundation
import SwiftUI

struct CustomСellModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
    }
}

extension View {
    func customСell() -> some View {
        self.modifier(CustomСellModifier())
    }
}

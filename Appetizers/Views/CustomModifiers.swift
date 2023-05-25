//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by James Lea on 5/24/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() {
        self.modifier(StandardButtonStyle())
    }
}

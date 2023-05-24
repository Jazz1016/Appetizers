//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}

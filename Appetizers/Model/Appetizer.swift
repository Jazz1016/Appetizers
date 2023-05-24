//
//  Appetizer.swift
//  Appetizers
//
//  Created by James Lea on 5/22/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "goyim",
        description: "oy vey!!!!",
        price: 10.01,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99)
    
    
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItem = Appetizer(
        id: 0001,
        name: "goyim",
        description: "oy vey!!!!",
        price: 10.01,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99)
    static let orderItem1 = Appetizer(
        id: 0002,
        name: "goyim",
        description: "oy vey!!!!",
        price: 10.01,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99)
    static let orderItem2 = Appetizer(
        id: 0003,
        name: "goyim",
        description: "oy vey!!!!",
        price: 10.01,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99)
    
    static let orderItems = [orderItem, orderItem1, orderItem2]
}

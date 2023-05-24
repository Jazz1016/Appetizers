//
//  OrderView.swift
//  Appetizers
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

struct OrderView: View {
//    @State var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.delete)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        let cost = order.items.reduce(0.0) {$0 + $1.price}
                        APButton(title: "$\(cost, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 20)
                    
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add an appetizer to your order.")
                }
            }
            .navigationTitle("Orders 🧾")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.delete(at: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

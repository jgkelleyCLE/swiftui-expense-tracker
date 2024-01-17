//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jack Kelley on 1/16/24.
//

import Foundation


struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "expenseItems")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "expenseItems"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}

//
//  AddExpense.swift
//  iExpense
//
//  Created by Jack Kelley on 1/16/24.
//

import SwiftUI

struct AddExpense: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var amount = 0
    @State private var type = "Personal"
    
    var expenses: Expenses
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self){type in
                        Text(type)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(newExpense)
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    AddExpense(expenses: Expenses())
}

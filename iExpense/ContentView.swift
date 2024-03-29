//
//  ContentView.swift
//  iExpense
//
//  Created by Jack Kelley on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var sheetShowing = false
    

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(item.name)")
                            Text("\(item.type)")
                                .font(.caption)
                                .foregroundStyle(item.type == "Business" ? .blue : .green)
                                .italic()
                        }
                        
                        Spacer()
                        
                        Text("$\(item.amount)")

                    }
                    
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("iExpense")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    if expenses.items.count > 0 {
                        EditButton()
                    } else {
                        EmptyView()
                    }

                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {

                        sheetShowing.toggle()
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $sheetShowing){
                        AddExpense(expenses: expenses)
                    }
                }
            }
        }
    }
    
    func removeRows(offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}

//
//  ExpensesView.swift
//  iExpense
//
//  Created by Thomas Meyer on 25/06/2024.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]

    var body: some View {
        List {
            Section("Personal") {
                ForEach(expenses) { item in
                    if item.type == "Personal" {
                        DisplayItem(item: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
            
            Section("Business") {
                ForEach(expenses) { item in
                    if item.type == "Business" {
                        DisplayItem(item: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
        
    init(sortOrder: [SortDescriptor<ExpenseItem>], showingMenu: String) {
        if showingMenu.count < 1 {
            _expenses = Query(sort: sortOrder)
        } else {
            _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
                expense.type.contains(showingMenu)
            } ,sort: sortOrder)
        }
    }
}

#Preview {
    ExpensesView(sortOrder: [SortDescriptor(\ExpenseItem.name)], showingMenu: "All")
        .modelContainer(for: ExpenseItem.self)
}

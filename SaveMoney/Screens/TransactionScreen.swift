//
//  TransactionScreen.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//

import SwiftUI
import SwiftData




struct TransactionScreen: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var context
    @State private var addNewTransaction: Bool = false
    @Query(sort: \Transaction.budget) private var transactions: [Transaction]

    
    
    var body: some View {
        NavigationStack {
           
                List{
                    if transactions.isEmpty{
                        ContentUnavailableView("Press '+' to enter a transaction.",  systemImage: "building.columns.circle").foregroundStyle(.blue).padding()
                    } else {
                        
                        ForEach(transactions) { transaction in
                            NavigationLink{
                                EditTransactionScreen(transaction: transaction)
                            }label: {
                                TransactionCardView(transaction: transaction)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let transaction = transactions[index]
                                context.delete(transaction)
                            }
                        })
                    }
                       
                }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading){
                            Button( action: {
                                HapticManager.notification(type: .success)
                            }, label: {
                                Image(systemName: "line.3.horizontal.circle.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            })
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            Button( action: {
                                addNewTransaction = true
                                HapticManager.notification(type: .success)
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            })
                        }
                    }///endOfToolbar
                    .sheet(isPresented: $addNewTransaction) {
                        AddTransactionView(transaction: Transaction())
                            .presentationDetents([.medium])
                    }
                    .navigationTitle("Transactions")
                }
            }
        }
    


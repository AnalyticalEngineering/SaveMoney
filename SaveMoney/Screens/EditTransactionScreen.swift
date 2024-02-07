//
//  EditTransactionScreen.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//

import SwiftUI

struct EditTransactionScreen: View {
    //PROPERTIES
    @Environment(\.dismiss) private var dismiss
    let transaction: Transaction
    @State private var budget: Budget
    @State private var title = ""
    @State private var subTitle = ""
    @State private var amount: Double = .zero
    @State private var dateAdded = Date.now
    
    
    init(transaction: Transaction) {
        self.transaction = transaction
        _budget = State(initialValue: Budget(rawValue: transaction.budget)!)
    }
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Budget Category:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    Picker("Budget", selection: $budget) {
                        ForEach(Budget.allCases)  { budget in
                            Text(budget.descr).tag(budget)
                        }
                    }.pickerStyle(.menu)
                        .buttonStyle(.borderedProminent)
                }
                    GroupBox {
                        LabeledContent {
                            DatePicker("", selection: $dateAdded, displayedComponents: .date)
                        } label: {
                            Text("Date ")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                                .fontWeight(.bold)
                        }
                    }.padding(.horizontal)
                    Divider()
                    Section("Transaction Name and Description") {
                        TextField("Best Buy", text: $title)
                            .foregroundStyle(.secondary)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        TextField("iPhone 16 Pro Max Upgrade", text: $subTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                    Divider()
                    Section("Transaction Amount"){
                        HStack(spacing: 5) {
                            HStack(spacing: 4) {
                                Text(currencySymbol)
                                TextField("Amount", value: $amount, formatter: numberFormatter)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
                    Divider()
            }
            .navigationTitle("Edit Transaction")
            .padding(.top, 10)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 5))
            Spacer()
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        if changed {
                            Button {
                                transaction.budget = budget.rawValue
                                transaction.title = title
                                transaction.subTitle = subTitle
                                transaction.dateAdded = dateAdded
                                transaction.amount = amount
                                HapticManager.notification(type: .success)
                                dismiss()
                            } label: {
                                Text("Update")
                            }
                            .frame(maxWidth: .infinity)
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
                .onAppear{
                    title = transaction.title
                    subTitle = transaction.subTitle
                    dateAdded = transaction.dateAdded
                    amount = transaction.amount
                }
        }
    }
    var changed: Bool {
        budget != Budget(rawValue: transaction.budget)!
        || title != transaction.title
        || subTitle != transaction.subTitle
        || dateAdded != transaction.dateAdded
        || amount != transaction.amount
    }
}

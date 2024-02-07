//
//  AddTransactionView.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//

import SwiftUI

struct AddTransactionView: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var subTitle = ""
    @State private var amount: Double = 0
    @State private var dateAdded: Date = .now
    @State private var budget: Budget = .Rent
    
    
    var body: some View {
        NavigationStack {
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
                }.padding(.top,15)
                VStack(alignment: .leading, content: {
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
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        TextField("iPhone 16 Pro Max Upgrade", text: $subTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
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
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                })
            }
           
            
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button( action: {
                        dismiss()
                        HapticManager.notification(type: .success)
                    }, label: {
                        Image(systemName: "x.circle.fill")
                            .imageScale(.large)
                    })
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Save") {
                        let newTransaction = Transaction(title: title, subTitle: subTitle, amount: amount, dateAdded: dateAdded, budget: budget)
                        context.insert(newTransaction)
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .disabled(title.isEmpty || subTitle.isEmpty || amount.isZero)
                    
                }
            }
        }///endOfToolbar
    }
    
}

#Preview {
    AddTransactionView()
}

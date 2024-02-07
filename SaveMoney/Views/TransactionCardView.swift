//
//  TransactionCardView.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//

import SwiftUI
import WidgetKit

struct TransactionCardView: View {
    var transaction: Transaction
    var body: some View {
    
            HStack(spacing: 4) {
                transaction.icon
                    .resizable()
                    .frame(width: 55, height: 55)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .background(.blue.gradient, in: .circle)
                    .padding(.trailing,10)
                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.title)
                        .font(.headline)
                        .foregroundStyle(Color.blue)
                        .fontWeight(.bold)
                    if !transaction.subTitle.isEmpty {
                        Text(transaction.subTitle)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.primary.secondary)
                    }
                
                Text(currencyString(transaction.amount, allowedDigits: 2))
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(.background, in: .rect(cornerRadius: 10))
        }
    }
}


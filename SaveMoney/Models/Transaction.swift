//
//  Transaction.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//


import SwiftData
import SwiftUI

@Model
class Transaction {
    var title: String
    var subTitle: String
    var amount: Double
    var dateAdded: Date
    var budget: Budget
    
    init(
        title: String = "",
        subTitle: String = "",
        amount: Double  = .zero,
        dateAdded: Date = Date.now,
        budget: Budget = .Rent
    ) {
        self.title = title
        self.subTitle = subTitle
        self.amount = amount
        self.dateAdded = dateAdded
        self.budget = budget
    }
    
    var icon: Image {
        switch budget {
        case .Mortgage:
           Image(systemName: "house.circle")
        case .Rent:
            Image(systemName: "house.circle")
        case .NaturalGas:
            Image(systemName: "flame.circle")
        case .Electricity:
            Image(systemName: "bolt.circle")
        case .Water:
            Image(systemName: "drop.circle")
        case .Sewage:
            Image(systemName: "drop.circle")
        case .Wifi:
            Image(systemName: "wifi.circle")
        case .Cellular:
            Image(systemName: "antenna.radiowaves.left.and.right.circle")
        case .Trash:
            Image(systemName: "trash.circle")
        case .Groceries:
            Image(systemName: "fork.knife.circle")
        case .Restaurants:
            Image(systemName: "fork.knife.circle")
        case .Vehicle:
            Image(systemName: "car.circle")
        case .Fuel:
            Image(systemName: "car.circle")
        case .Parking:
            Image(systemName: "car.circle")
        case .Transportation:
            Image(systemName: "car.circle")
        case .VehicleInsurance:
            Image(systemName: "car.circle")
        case .Medical:
            Image(systemName: "cross.case.circle")
        case .Health:
            Image(systemName: "heart.circle")
        case .HouseholdItems:
            Image(systemName: "house.circle")
        case .Education:
            Image(systemName: "books.vertical.circle")
        case .Family:
            Image(systemName: "person.2.circle")
        case .Gifts:
            Image(systemName: "gift.circle")
        case .Entertainment:
            Image(systemName: "popcorn.circle")
        case .Subscriptions:
            Image(systemName: "dollarsign.arrow.circlepath")
        case .Invest:
            Image(systemName: "building.columns.circle")
        case .Savings:
            Image(systemName: "building.columns.circle")
        case .Alimony:
            Image(systemName: "person.crop.circle")
        case .ChildSupport:
            Image(systemName: "figure.child.circle")
        case .Loans:
            Image(systemName: "building.columns.circle")
        case .CreditCards:
            Image(systemName: "creditcard.circle")
        case .Misc:
            Image(systemName: "m.circle")
        case .Charity:
            Image(systemName: "c.circle")
        case .Debt:
            Image(systemName: "building.columns.circle")
        }
    }
}
enum Budget: Int, Codable, Identifiable, CaseIterable {
    case Mortgage, Rent, NaturalGas, Electricity, Water, Sewage, Wifi, Cellular, Trash, Groceries, Restaurants,  Vehicle, Fuel, Parking, Transportation, VehicleInsurance, Medical, Health, HouseholdItems, Education, Family, Gifts, Entertainment, Subscriptions, Invest,  Savings, Debt, Alimony, ChildSupport, Loans, CreditCards, Misc, Charity
    var id: Self {
        self
    }
    var descr: String {
        switch self {
            
        case .Mortgage:
            "Mortgage"
        case .Rent:
            "Rent"
        case .NaturalGas:
            "Natural Gas"
        case .Electricity:
            "Electricity"
        case .Water:
            "Water"
        case .Sewage:
            "Sewage"
        case .Wifi:
            "Wifi"
        case .Cellular:
            "Cellular"
        case .Trash:
            "Trash"
        case .Groceries:
            "Groceries"
        case .Restaurants:
            "Restaurants"
        case .Vehicle:
            "Vehicle"
        case .Fuel:
            "Fuel"
        case .Parking:
            "Parking"
        case .Transportation:
            "Transportation"
        case .VehicleInsurance:
            "Vehicle Insurance"
        case .Medical:
            "Medical"
        case .Health:
            "Health"
        case .HouseholdItems:
            "Household Items"
        case .Education:
            "Education"
        case .Family:
            "Family"
        case .Gifts:
            "Gifts"
        case .Entertainment:
            "Entertainment"
        case .Subscriptions:
            "Subscriptions"
        case .Invest:
            "Invest"
        case .Savings:
            "Savings"
        case .Alimony:
            "Alimony"
        case .ChildSupport:
            "Child Support"
        case .Loans:
            "Loans"
        case .CreditCards:
            "Credit Cards"
        case .Misc:
            "Misc"
        case .Charity:
            "Charity"
        case .Debt:
            "Debt"
        }
    }
}

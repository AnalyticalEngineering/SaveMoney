//
//  SaveMoneyApp.swift
//  SaveMoney
//
//  Created by J. DeWeese on 2/6/24.
//

import SwiftUI
import SwiftData

@main
struct SaveMoneyApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            TransactionScreen()
                .modelContainer(for: Transaction.self)
        }
    }
    init() {
     
        let schema = Schema([Transaction.self])
        let config = ModelConfiguration("SaveMoneyApp", schema: schema)
        do{
            container = try ModelContainer(for: schema, configurations: config)
        }catch{
            fatalError("Could not configure container")
        }
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
        
    }


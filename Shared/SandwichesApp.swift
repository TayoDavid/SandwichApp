//
//  SandwichesAppApp.swift
//  Shared
//
//  Created by Omotayo on 18/02/2022.
//

import SwiftUI

@main
struct SandwichesApp: App {
//    @StateObject private var store = SandwichStore()
    @StateObject private var store = testStore
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

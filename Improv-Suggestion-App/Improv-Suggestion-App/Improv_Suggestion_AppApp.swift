//
//  Improv_Suggestion_AppApp.swift
//  Improv-Suggestion-App
//
//  Created by This on 09/07/2023.
//

import SwiftUI
import SwiftData

@main
struct Improv_Suggestion_AppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}

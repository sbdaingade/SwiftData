//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Sachin Daingade on 11/07/26.
//

import SwiftUI
import SwiftData
@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Person.self)
    }
}

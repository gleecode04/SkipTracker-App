//
//  skipTrackerApp.swift
//  skipTracker
//
//  Created by Anson Goo on 10/13/23.
//

import SwiftUI
import SwiftData

@main
struct skipTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ClassItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        
        let viewModel = ContentViewModel()
        
        WindowGroup {
            MainView()
                .modelContainer(for: ClassItem.self)
                .onAppear{
                    viewModel.checkIfLocationServiceIsEnabled()
                }
        }
        .modelContainer(sharedModelContainer)
        .modelContainer(for: Track.self)
    }
}

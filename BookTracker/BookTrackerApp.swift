//
//  BookTrackerApp.swift
//  BookTracker
//
//  Created by Stevie on 1/20/24.
//

import SwiftUI
import SwiftData

@main
struct BookTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

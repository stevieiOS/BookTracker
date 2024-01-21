//
//  EditBookView.swift
//  BookTracker
//
//  Created by Stevie on 1/20/24.
//

import SwiftUI

struct EditBookView: View {
    // let book: Book
    
    @State private var status = Status.onShelf
    @State private var rating: Int?
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var dateAdded = Date.distantPast
    @State private var dateStarted = Date.distantPast
    @State private var dateCompleted = Date.distantPast
    
    var body: some View {
        HStack {
            Text("Status")
            Picker("Status", selection: $status) {
                ForEach(Status.allCases) { status in
                    Text(status.descr).tag(status)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        VStack(alignment: .leading) {
            GroupBox {
                LabeledContent {
                    DatePicker("", selection: $dateAdded, displayedComponents: .date)
                } label: {
                    Text("Date Added")
                }
                if status == .inProgress || status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateStarted, displayedComponents: .date)
                    } label: {
                        Text("Date Added")
                    }
                }
                if status == .inProgress || status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateCompleted, displayedComponents: .date)
                    } label: {
                        Text("Date Added")
                    }
                }
            }
            .foregroundStyle(.secondary)
            .onChange(of: status) { oldValue, newValue in
                if newValue == .onShelf {
                    dateStarted = Date.distantPast
                    dateCompleted = Date.distantPast
                } else if newValue == .inProgress && oldValue == .completed {
                    //from completed to in progress
                    dateCompleted = Date.distantPast
                } else if newValue == .inProgress && oldValue == .onShelf {
                    // book in progress
                    dateStarted = Date.now
                } else if newValue == .completed && oldValue == .onShelf {
                    // forgot to start book
                    dateCompleted = Date.now
                    dateStarted = dateAdded
                } else {
                    //completed
                    dateCompleted = Date.now
                }
            }
            Divider()
        }
    }
}


#Preview {
    EditBookView()
}

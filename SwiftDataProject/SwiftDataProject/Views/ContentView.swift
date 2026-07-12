//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Sachin Daingade on 11/07/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var path = [Person]()
    @State private var searchText: String = ""
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    var body: some View {
        NavigationStack(path: $path) {
            PersonView(seachString: searchText, sorderOrder: sortOrder)
                .navigationTitle("List of users")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person)
                }
                .toolbar {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("sort",selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([SortDescriptor(\Person.name)])
                            
                            Text("Name (Z-A)")
                                .tag([SortDescriptor(\Person.name, order: .reverse)])
                        }
                    }
                    Button("Add Person", systemImage: "plus", action: addNewPerson)
                }
                .searchable(text: $searchText, prompt: "Search by name")
        }
    }
    func addNewPerson() {
        let person = Person(name: "", email: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
}




#Preview {
    ContentView()
}

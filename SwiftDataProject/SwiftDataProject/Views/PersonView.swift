//
//  PersonView.swift
//  SwiftDataProject
//
//  Created by Sachin Daingade on 11/07/26.
//
import SwiftUI
import SwiftData

struct PersonView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var persons: [Person]
    
    var body: some View {
        List {
            ForEach(persons) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    init(seachString: String = "", sorderOrder: [SortDescriptor<Person>] = []) {
        _persons = Query(filter: #Predicate<Person> { person in
            if seachString.isEmpty {
                return true
            } else {
                person.name.localizedStandardContains(seachString) ||
                person.email.localizedStandardContains(seachString) || person.details.localizedStandardContains(seachString)
            }
        }, sort: sorderOrder)
        
    }
    
    func deletePeople(at OffSets: IndexSet) {
     // delete all records in single
       // try? modelContext.delete(model: Person.self)
        
        for offset in OffSets {
            let person = persons[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    PersonView()
}

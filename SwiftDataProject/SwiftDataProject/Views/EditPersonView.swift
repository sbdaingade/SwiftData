//
//  EditPersonView.swift
//  SwiftDataProject
//
//  Created by Sachin Daingade on 12/07/26.
//

import SwiftUI

struct EditPersonView: View {
    @Bindable var person: Person

    var body: some View {
        
        Form {
            Section(header: Text("Personal Information")) {
                TextField("First Name", text: $person.name)
                    .textContentType(.name)
                TextField("Email ID", text: $person.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
            }
            
            Section("Notes") {
                TextField("Details", text: $person.details, axis: .vertical)
            }
        }
        .onTapGesture {
                   hideKeyboard() // Forces any active field to drop keyboard focus
               }
        .navigationTitle("Edit")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
//#Preview {
//    EditPersonView()
//}

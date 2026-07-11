//
//  Person.swift
//  SwiftDataProject
//
//  Created by Sachin Daingade on 11/07/26.
//
import Foundation
import SwiftData

@Model
class Person {
    var name: String
    var email: String
    var details: String

    init(name: String, email: String, details: String) {
        self.name = name
        self.email = email
        self.details = details
    }
}



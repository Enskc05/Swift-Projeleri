//
//  Users.swift
//  SwiftOOP
//
//  Created by Enes Koç on 25.09.2024.
//

import Foundation

enum type {
    case Admin
    case User
    case Guest
}


class Users {
    
    var name : String
    var age : Int
    var job : String
    var type : type
    
    
    //initalizer
    
    init(name: String, age: Int, job: String, type: type) {
        self.name = name
        self.age = age
        self.job = job
        self.type = type
    }
    
    func userInfo() {
        print("Name: \(name), Age: \(age), Job: \(job), Type: \(type)")
    }
}

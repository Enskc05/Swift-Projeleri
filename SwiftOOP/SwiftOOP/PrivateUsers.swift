//
//  PrivateUsers.swift
//  SwiftOOP
//
//  Created by Enes Koç on 25.09.2024.
//

import Foundation


class PrivateUsers: Users {
    func newFunction() {
        print("Hello from PrivateUsers")
    }
    
    override func userInfo() {
        super.userInfo()
        print("Private Users")
    }
}

//
//  User.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 03/09/2022.
//

import Foundation

struct User: Identifiable {
    var id: String
    var phoneNumber: String
    var firstName: String
    var lastName: String
    var dateOfBirth: String
    var email: String
    var address: String
    var isAdmin: Int
}

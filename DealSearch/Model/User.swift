/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 03/09/2022
  Last modified: 15/09/2022
  Acknowledgement: None
*/

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

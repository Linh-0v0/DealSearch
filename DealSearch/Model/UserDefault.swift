/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3

  Created date: 18/08/2022
  Last modified: 28/08/2022
  Acknowledgement:
    - UserDefaults Logic: https://viblo.asia/p/userdefaults-trong-swift-51-WAyK8OkN5xX
*/

import Foundation

struct Defaults {
    static let (emailKey, favDealKey) = ("email", "favDeal")
    static let userSessionKey = "CurrentUser"
    private static let userDefault = UserDefaults.standard
    
    
    /* Is used to save User to UserDefault following this "UserDetail Struct"*/
    struct UserDetails {
        let email: String
        let favDeal: String
        
        init(_ json: [String: String]) {
            self.email = json[emailKey] ?? ""
            self.favDeal = json[favDealKey] ?? ""
        }
    }
    
    /* Save User to userDefault */
    static func save(_ email: String, favDeal: String){
        // Save user forkey "CurrentUser" to know whose the login state belong to
        userDefault.set([emailKey: email, favDealKey: favDeal],
                        forKey: userSessionKey)
        saveToUsersList(email, favDeal: favDeal)
    }
    
    static func saveToUsersList(_ email: String, favDeal: String){
        // Save user to user list
        userDefault.set([emailKey: email, favDealKey: favDeal],
                        forKey: email)
    }
    
    /* Update User */
    static func update(userKey: String, email: String, favDeal: String) {
        userDefault.set([emailKey: email, favDealKey: favDeal],
                        forKey: userKey)
    }
    
    /* Get Value from UserDefaults */
    static func getCurrentUserDetail() -> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
    
    static func getSpecifiedUserDetail(email: String) -> UserDetails {
        return UserDetails((userDefault.value(forKey: email) as? [String: String]) ?? [:])
    }
    
    // Return User List containing all Users
    static func getUsersList() -> [String: [Any]] {
        var allUsersArr: [String:[Any]] = [:]
        
        for data in userDefault.dictionaryRepresentation() {
            if (data.value is NSDictionary) && (data.key != userSessionKey){
                allUsersArr[data.key] = [data.value]
            }
        }
        return allUsersArr
    }
    
    
    /* Delete UserDefault */
    // Remove the current signed-in player
    static func clearUserSessionData() {
        userDefault.removeObject(forKey: userSessionKey)
    }
    
    // Remove the specified user
    static func clearUserData(email: String){
        userDefault.removeObject(forKey: email)
    }
    
    // Remove all Users
    static func clearAllUsers() {
        for data in userDefault.dictionaryRepresentation() {
            userDefault.removeObject(forKey: data.key)
        }
    }
    
}

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
    static let (nameKey, attrb1Key, attrb2Key) = ("username", "attrb1", "attrb2")
    static let userSessionKey = "CurrentUser"
    private static let userDefault = UserDefaults.standard
    
    
    /* Is used to save User to UserDefault following this "UserDetail Struct"*/
    struct UserDetails {
        let username: String
        let attrb1: String
        let attrb2: String
        
        init(_ json: [String: String]) {
            self.username = json[nameKey] ?? ""
            self.attrb1 = json[attrb1Key] ?? "0"
            self.attrb2 = json[attrb2Key] ?? "0"
        }
    }
    
    /* Save User to userDefault */
    static func save(_ username: String, attrb1: String, attrb2: String){
        // Save user forkey "CurrentUser" to know whose the login state belong to
        userDefault.set([nameKey: username, attrb1Key: attrb1, attrb2Key: attrb2],
                        forKey: userSessionKey)
        saveToUsersList(username, attrb1: attrb1, attrb2: attrb2)
        
    }
    
    static func saveToUsersList(_ username: String, attrb1: String, attrb2: String){
        // Save user to user list
        userDefault.set([nameKey: username, attrb1Key: attrb1, attrb2Key: attrb2],
                        forKey: username)
    }
    
    /* Get Value from UserDefaults */
    static func getCurrentUserDetail() -> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
    
    static func getSpecifiedUserDetail(username: String) -> UserDetails {
        return UserDetails((userDefault.value(forKey: username) as? [String: String]) ?? [:])
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
    static func clearUserData(username: String){
        userDefault.removeObject(forKey: username)
    }
    
    // Remove all Users
    static func clearAllUsers() {
        for data in userDefault.dictionaryRepresentation() {
            userDefault.removeObject(forKey: data.key)
        }
    }
    
}

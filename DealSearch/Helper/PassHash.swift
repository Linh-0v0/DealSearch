////
////  PassHash.swift
////  DealSearch
////
////  Created by Vu Bui Khanh Linh on 03/09/2022.
////
//
//import Foundation
//import CryptoSwift
//
//let key = "X49EVTLowcmmm7RvTZD2Uz0K9LAXz3Ph"
//let iv = "0dYjxZLZZrUr9EUyN"
//
//extension String {
//    //    let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7)
//    //    let aes = try AES(key: key, iv: iv, padding: .pkcs7)
//    
//    func aesEncrypt(key: String, iv: String) throws -> String {
//        var encryptedData: Data?;
//        let data = self.data(using: .utf8)!
//        do {
//            let aes = try AES(key: key, iv: iv, padding: .pkcs7)
//            let encrypted = try aes.encrypt([UInt8](data))
//            encryptedData = Data(encrypted)
//        } catch {
//            print(error)
//        }
//        return (encryptedData?.toHexString())!
//    }
//    
//    func aesEncryptData(key: String, iv: String) throws -> Data? {
//        var encryptedData: Data?;
//        let data = self.data(using: .utf8)!
//        do {
//            let aes = try AES(key: key, iv: iv, padding: .pkcs7)
//            let encrypted = try aes.encrypt([UInt8](data))
//            encryptedData = Data(encrypted)
//        } catch {
//            print(error)
//        }
//        return encryptedData
//    }
//    
//    func aesDecrypt(key: String, iv: String) throws -> String {
//        var decryptedData: Data?;
//        var data = try aesEncryptData(key: key, iv: iv)
//        do {
//            let aes = try AES(key: key, iv: iv, padding: .pkcs7)
//            let decrypted = try aes.decrypt([UInt8](data?))
//            decryptedData = Data(decrypted)
//        } catch {
//            print(error)
//        }
//        return decryptedData?.toHexString() ?? "Could not decrypt"
//    }
//    
////    func dataFromHexadecimalString() -> Data? {
////        var data = Data(capacity: count / 2)
////        do {
////            let regex = try NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
////            regex.enumerateMatches(in: self, options: [], range: NSMakeRange(0, count)) { match, flags, stop in
////                let byteString = (self as NSString).substring(with: match!.range)
////                let num = UInt8(byteString, radix: 16)
////                data.append(num!)
////            }
////        } catch {
////            print(error)
////        }
////        return data
////    }
////
//}
//
//extension Data {
//    
//    var bytes: Array<UInt8> {
//        return Array(self)
//    }
//    
//    func toHexString() -> String {
//        return bytes.toHexString()
//    }
//    
//}
//

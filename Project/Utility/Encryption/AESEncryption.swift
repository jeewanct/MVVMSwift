//
//  AESEncryption.swift
//  Project
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation
import CryptoSwift

class AESEncryption{
    
    static let shared = AESEncryption()
    var privateKey = ""
    var iv = ""
    
    func checkForKey(){
        if let key = KeychainService.loadValue(service: AESEncryptionKey.key.rawValue, account: AESEncryptionKey.key.rawValue), let iv = KeychainService.loadValue(service: AESEncryptionKey.iv.rawValue, account: AESEncryptionKey.iv.rawValue){
            privateKey = key
            self.iv = iv
        }else{
            let key = String(UUID().uuidString.sha256().prefix(32))
            let iv = String(UUID().uuidString.sha256().prefix(16))
            KeychainService.saveValue(service: AESEncryptionKey.key.rawValue, account: AESEncryptionKey.key.rawValue, data: key)
            KeychainService.saveValue(service: AESEncryptionKey.iv.rawValue, account: AESEncryptionKey.iv.rawValue, data: iv)
            privateKey = key
            self.iv = iv
        }
    }
    
    func encryptData(_ message:String) -> (status:Bool,encryptedMessage:String){
        do {
            let encryptedMessage = try aesEncrypt(message: message, key: privateKey, iv: iv)
            return (true,encryptedMessage)
        }catch{
            print("Something wetn wrong!")
            return (false,"Encryption Failed")
        }
    }
    func decryptData(_ message:String) -> (status:Bool,decryptedMessage:String){
        do {
            let decryptMessage = try aesDecrypt(encryptedMessage: message, key: privateKey, iv: iv)
            return (true,decryptMessage)
        }catch{
            print("Something wetn wrong!")
            return (false,"Decryption Failed")
        }
    }
    func aesEncrypt(message:String, key: String, iv: String) throws -> String {
        let data = message.data(using: String.Encoding.utf8)
        let encrypted = try AES(key: key, iv: iv, padding: .pkcs7).encrypt((data?.bytes)!)
        let encData = Data(bytes: encrypted, count: encrypted.count)
        let base64str = encData.base64EncodedString(options: .init(rawValue: 0))
        let result = String(base64str)
        return result
    }

    func aesDecrypt(encryptedMessage:String, key: String, iv: String) throws -> String {
        let data = Data(base64Encoded: encryptedMessage) ?? Data()
        do{
            let decrypted = try AES(key: key, iv: iv, padding: .pkcs7).decrypt(Array(data))
            let decryptedData = Data(decrypted)
            return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
        } catch let error {
            print("Error: \(error)" )
            return ""
        }
    }
}

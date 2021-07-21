//
//  AESEncryptionHelper.swift
//  Project
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation

extension String{
    func encryptedValue() -> String{
        return AESEncryption.shared.encryptData(self).encryptedMessage
    }
    
    func decryptedValue() -> String{
        return AESEncryption.shared.decryptData(self).decryptedMessage
    }
}

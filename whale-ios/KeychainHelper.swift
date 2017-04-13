//
//  KeychainHelper.swift
//  whale-ios
//
//  Created by Kenny Batista on 4/10/17.
//  Copyright © 2017 Kenny Batista. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainHelper {
    
    // Instantiation
    static let keychain = Keychain()
    
    // Save to Keychai
    static func saveToKeychain(key: String, value: String) throws {
        try self.keychain.set(key, key: value)
    }
    
    
    // Get from Keychain
    static func getFromKeychain(key: String) -> String? {
        do {
            return try keychain.get(key)
        } catch {
            return nil
        }
        
    }
    
    // Is keychain available
    static func isKeychainAvailable(key: String) -> Bool {
        if self.getFromKeychain(key: key) != nil {
            print("There is as keychain value")
            return true
        } else {
            print("There is no keychain")
            return false
        }
    }
    
}

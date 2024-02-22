//
//  UserDefaultService.swift
//  AzPref
//
//  Created by Sefa Aycicek on 22.02.2024.
//

import UIKit

class UserDefaultService: NSObject {
    
    private let ROOT_KEY = "root_key"
    private let SUB_KEY = "sub_key"
    
    func setRootValue(value : Int) {
        UserDefaults.standard.setValue(value, forKey: ROOT_KEY)
    }
    
    func getRootValue() -> Int? {
        return UserDefaults.standard.object(forKey: ROOT_KEY) as? Int
    }
    
    func setSubValue(value : Int) {
        UserDefaults.standard.setValue(value, forKey: SUB_KEY)
    }
    
    func getSubValue() -> Int? {
        return UserDefaults.standard.object(forKey: SUB_KEY) as? Int
    }
    
}
